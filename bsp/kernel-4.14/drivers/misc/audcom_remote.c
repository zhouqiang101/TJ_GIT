#include <linux/kernel.h>
#include <linux/version.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/delay.h>
#include <linux/input.h>
#include <linux/interrupt.h>
#include <linux/fs.h>
#include <linux/fcntl.h>
#include <linux/cdev.h>
#include <linux/sched.h>
#include <linux/kthread.h>
#include <linux/mm.h>
#include <linux/fs.h>
#include <linux/completion.h>
#include <linux/atomic.h>
#include <linux/sysfs.h>
#include <linux/string.h>
#include <linux/gpio.h>
#include <linux/platform_device.h>
#include <linux/kobject.h>
#include <linux/mutex.h>
#include <linux/jiffies.h>
#include <linux/workqueue.h>
#include <linux/sunxi/gpio.h>

#define INPUT_INTR       _SUNXI_GPIO(E, 3)
#define INTR_SCAN_DUR    25

#define RAW_KEYCODE_01   0x30
#define RAW_KEYCODE_02   0x38
#define RAW_KEYCODE_03   0x34
#define RAW_KEYCODE_04   0x08
#define RAW_KEYCODE_05   0x0C
#define RAW_KEYCODE_06   0x04
#define RAW_KEYCODE_07   0x24
#define RAW_KEYCODE_08   0x20
#define RAW_KEYCODE_09   0x28
#define RAW_KEYCODE_10   0x14
#define RAW_KEYCODE_11   0x10
#define RAW_KEYCODE_12   0x18

#define KEYCODE_COUNT 12
static const unsigned int kKeyCodes[KEYCODE_COUNT] =
{
	KEY_A, KEY_B, KEY_C, KEY_D, KEY_E, KEY_F,
	KEY_G, KEY_H, KEY_I, KEY_J, KEY_K, KEY_L
};

struct key_status {
	int keyCode;
	int keyDown;
};

struct driver_priv {
	struct input_dev *input;
	struct i2c_client *client;
	struct delayed_work work;
	struct key_status state[KEYCODE_COUNT];
};

static int perform_i2c_read(struct i2c_client *client, u8 reg)
{
	int ret = i2c_smbus_read_byte_data(client, reg);
	if (ret < 0) {
		return -1;
	}
	return ret & 0xFF;
}

static unsigned int getKeyCode(int val)
{
	switch (val) {
		case RAW_KEYCODE_01: return KEY_A;
		case RAW_KEYCODE_02: return KEY_B;
		case RAW_KEYCODE_03: return KEY_C;
		case RAW_KEYCODE_04: return KEY_D;
		case RAW_KEYCODE_05: return KEY_E;
		case RAW_KEYCODE_06: return KEY_F;
		case RAW_KEYCODE_07: return KEY_G;
		case RAW_KEYCODE_08: return KEY_H;
		case RAW_KEYCODE_09: return KEY_I;
		case RAW_KEYCODE_10: return KEY_J;
		case RAW_KEYCODE_11: return KEY_K;
		case RAW_KEYCODE_12: return KEY_L;
	}
	return 0;
}

static void remoteIntr_queue_work(struct driver_priv *data)
{
	unsigned long delay = msecs_to_jiffies(INTR_SCAN_DUR);
	if (delay >= HZ) {
		delay = round_jiffies_relative(delay);
	}
	queue_delayed_work(system_freezable_wq, &data->work, delay);
}

static void remoteIntr_work(struct work_struct *work)
{
	struct driver_priv *data =
		container_of(work, struct driver_priv, work.work);
	struct input_dev *input = data->input;
	unsigned int keyCode;
	int intr;
	int needreport;
	int ret, i;

	// Read gpio status
	intr = gpio_get_value(INPUT_INTR);
	if (intr == 0) {  // No key pressed
		int needsync = 0;
		for (i = 0; i < KEYCODE_COUNT; i++) {
			if (data->state[i].keyDown) {
				printk("[HL_AUDIOBOX] Key %d released\n", data->state[i].keyCode);
				input_event(input, EV_KEY, data->state[i].keyCode, 0);
				data->state[i].keyDown = 0;
				needsync = 1;
			}
		}
		if (needsync) {
			input_sync(input);
		}
		remoteIntr_queue_work(data);
		return;
	}

	// Read pressed key
	ret = perform_i2c_read(data->client, 0x00);
	if (ret < 0) {
		remoteIntr_queue_work(data);
		return;
	}
	// No key pressed
	if (ret == 0) {
		remoteIntr_queue_work(data);
		return;
	}
	// Has key pressed
	needreport = 0;
	keyCode = getKeyCode(ret);
	if (keyCode == 0) {
		remoteIntr_queue_work(data);
		return;
	}
	for (i = 0; i < KEYCODE_COUNT; i++) {
		if (data->state[i].keyCode == keyCode) {
			if (!data->state[i].keyDown) {
				printk("[HL_AUDIOBOX] Key %d pressed\n", data->state[i].keyCode);
				data->state[i].keyDown = 1;
				needreport = 1;
			}
			break;
		}
	}
	if (needreport) {
		input_event(input, EV_KEY, keyCode, 1);
		input_sync(input);
	}
	remoteIntr_queue_work(data);
	return;
}

static int _input_open(struct input_dev *input)
{
	struct driver_priv *data = input_get_drvdata(input);
	int i;

	for (i = 0; i < KEYCODE_COUNT; i++) {
		data->state[i].keyDown = 0;
	}
	remoteIntr_queue_work(data);

	return 0;
}

static void _input_close(struct input_dev *input)
{
	struct driver_priv *data = input_get_drvdata(input);
	int i;

	cancel_delayed_work_sync(&data->work);
	for (i = 0; i < KEYCODE_COUNT; i++) {
		data->state[i].keyDown = 0;
	}
}

static int audcomremote_probe(struct i2c_client *i2c,
	const struct i2c_device_id *id)
{
	struct driver_priv *data = NULL;
	struct input_dev *input;
	int i;

	printk("[HL_AUDIOBOX] Initialize audcom 2.4G remote controller\n");

	// Allocate driver data
	data = (struct driver_priv *)kzalloc(
		sizeof(struct driver_priv), GFP_KERNEL);
	if (data == NULL) {
		printk("[HL_AUDIOBOX] Failed to allocate memory\n");
		return -ENOMEM;
	}

	// Allocate input device
	input = input_allocate_device();
	if (input == NULL) {
		printk("[HL_AUDIOBOX] Failed to allocate input device\n");
		return -ENOMEM;
	}

	// Initialize variables
	data->input = input;
	data->client = i2c;
	for (i = 0; i < KEYCODE_COUNT; i++) {
		data->state[i].keyCode = kKeyCodes[i];
		data->state[i].keyDown = 0;
	}

	// Initialize input device
	input->phys = "audcom-remote/input0";
	input->name = "audcom-remote";
	input->dev.parent = &i2c->dev;
	input->id.bustype = BUS_HOST;
	input->id.vendor = 0x0001;
	input->id.product = 0x0001;
	input->id.version = 0x0100;
	__set_bit(EV_KEY, input->evbit);
	__set_bit(EV_REP, input->evbit);
	for (i = 0; i < KEYCODE_COUNT; i++) {
		input_set_capability(input, EV_KEY, kKeyCodes[i]);
	}
	input->open = _input_open;
	input->close = _input_close;
	input_set_drvdata(input, data);

	// Allocate intr work
	if (gpio_request(INPUT_INTR, "audcomremote_int") < 0) {
		printk("[HL_AUDIOBOX] Failed to allocate audcom remote int gpio\n");
		return -ENOMEM;
	}
	gpio_direction_input(INPUT_INTR);
	INIT_DELAYED_WORK(&data->work, remoteIntr_work);

	// Register input device
	if (input_register_device(input)) {
		printk("[HL_AUDIOBOX] Failed to register input device\n");
		return -ENOMEM;
	}
	i2c_set_clientdata(i2c, data);

        return 0;
}

static int audcomremote_remove(struct i2c_client *client)
{
	struct driver_priv *data =
		(struct driver_priv *)i2c_get_clientdata(client);

	cancel_delayed_work_sync(&data->work);
	input_unregister_device(data->input);
	kfree(data);

	return 0;
}

static const struct of_device_id audcomremote_of_match[] = {
	{ .compatible = "audcom,audcomremote", },
	{ }
};
MODULE_DEVICE_TABLE(of, audcomremote_of_match);

static const struct i2c_device_id audcomremote_i2c_id[] = {
	{ "audcomremote", 0 },
	{ }
};
MODULE_DEVICE_TABLE(i2c, audcomremote_i2c_id);

static struct i2c_driver audcomremote_i2c_driver = {
	.driver = {
		.name = "audcomremote-i2c",
		.of_match_table = audcomremote_of_match,
	},
	.probe = audcomremote_probe,
	.remove = audcomremote_remove,
	.id_table = audcomremote_i2c_id,
};

module_i2c_driver(audcomremote_i2c_driver);

MODULE_DESCRIPTION("Audcom 2.4G remote driver");
MODULE_AUTHOR("Wang YuFei <At-Com, SZ>");
MODULE_LICENSE("GPL v2");
