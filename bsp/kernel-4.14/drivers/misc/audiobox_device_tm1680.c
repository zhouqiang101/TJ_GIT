#include <linux/kernel.h>
#include <linux/version.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/delay.h>
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
#include <linux/time.h>
#include <linux/sunxi/gpio.h>

// Front led gpio
/********************************************************/
#define FRONT_LED _SUNXI_GPIO(A, 13)
/********************************************************/

// Maximum data size
/********************************************************/
#define MAX_DATA_SIZE 10
/********************************************************/

#define BLINK_HZ_0  1
#define BLINK_HZ_05 4
#define BLINK_HZ_1  3
#define BLINK_HZ_2  2

#define OSC_INNER_MODE0 1
#define OSC_INNER_MODE1 2
#define OSC_EXT_MODE0   3
#define OSC_EXT_MODE1   4

#define NMOS_8COM  1
#define NMOS_16COM 2
#define PMOS_8COM  3
#define PMOS_16COM 4

#define CMD_SYSDIS_REG80     0x80
#define CMD_SYSEN_REG81      0x81
#define CMD_LEDOFF_REG82     0x82
#define CMD_LENON_REG83      0x83
#define CMD_BLINKOFF_REG88   0x88
#define CMD_BLINK2HZ_REG89   0x89
#define CMD_BLINK1HZ_REG8A   0x8A
#define CMD_BLINK05HZ_REG8B  0x8B
#define CMD_SMODE_REG90      0x90
#define CMD_MMODE0_REG98     0x98
#define CMD_MMODE1_REG9A     0x9A
#define CMD_EXTCLKM0_REG9C   0x9C
#define CMD_EXTCLKM1_REG9E   0x9E
#define CMD_8COM_NMOS_REGA0  0xA0
#define CMD_16COM_NMOS_REGA4 0xA4
#define CMD_8COM_PMOS_REGA8  0xA8
#define CMD_16COM_PMOS_REGAC 0xAC
#define CMD_PWMPUTY_REGB0    0xB0

#define START_DATAREG        0x00

struct tm1680_priv {
	struct i2c_client *client;
	struct mutex lock;
	int front_led;
	u8 contrast;
	u8 data[MAX_DATA_SIZE];
};

// Global unique instance
static struct tm1680_priv *g_instance = NULL;

static int tm1680_i2c_write_cmd(struct tm1680_priv *context, u8 cmd)
{
	struct i2c_client *client = context->client;
	int ret;

	ret = i2c_smbus_write_byte(client, cmd);
	mdelay(5);
	return ret;
}

static int tm1680_i2c_write_value(struct tm1680_priv *context, u8 reg, u8 value)
{
	struct i2c_client *client = context->client;
	int ret;

	ret = i2c_smbus_write_byte_data(client, reg, value);
	mdelay(5);
	return ret;
}

static int tm1680_i2c_write_buffer(struct tm1680_priv *context, u8 reg, const u8 *buffer, u8 length)
{
	struct i2c_client *client = context->client;
	int ret;

	ret = i2c_smbus_write_i2c_block_data(client, reg, length, buffer);
	mdelay(5);
	return ret;
}

static int tm1680_oscmode(struct tm1680_priv *context, int mode)
{
	if (mode == OSC_INNER_MODE0)
		return tm1680_i2c_write_cmd(context, CMD_MMODE0_REG98);
	else if (mode == OSC_INNER_MODE1)
		return tm1680_i2c_write_cmd(context, CMD_MMODE1_REG9A);
	else if (mode == OSC_EXT_MODE0)
		return tm1680_i2c_write_cmd(context, CMD_EXTCLKM0_REG9C);
	else if (mode == OSC_EXT_MODE1)
		return tm1680_i2c_write_cmd(context, CMD_EXTCLKM1_REG9E);
	return -1;
}

static int tm1680_blink(struct tm1680_priv *context, int status)
{
	if (status == BLINK_HZ_0)
		return tm1680_i2c_write_cmd(context, CMD_BLINKOFF_REG88);
	else if (status == BLINK_HZ_2)
		return tm1680_i2c_write_cmd(context, CMD_BLINK2HZ_REG89);
	else if (status == BLINK_HZ_1)
		return tm1680_i2c_write_cmd(context, CMD_BLINK1HZ_REG8A);
	else if (status == BLINK_HZ_05)
		return tm1680_i2c_write_cmd(context, CMD_BLINK05HZ_REG8B);
	return -1;
}

static int tm1680_com_option(struct tm1680_priv *context, int option)
{
	if (option == NMOS_8COM)
		return tm1680_i2c_write_cmd(context, CMD_8COM_NMOS_REGA0);
	else if (option == NMOS_16COM)
		return tm1680_i2c_write_cmd(context, CMD_16COM_NMOS_REGA4);
	else if (option == PMOS_8COM)
		return tm1680_i2c_write_cmd(context, CMD_8COM_PMOS_REGA8);
	else if (option == PMOS_16COM)
		return tm1680_i2c_write_cmd(context, CMD_16COM_PMOS_REGAC);
	return -1;
}

static int tm1680_contrast(struct tm1680_priv *context, uint8_t contrast_value)
{
	contrast_value &= 0x0F;
	return tm1680_i2c_write_cmd(context, CMD_PWMPUTY_REGB0 + contrast_value);
}

static int tm1680_init(struct tm1680_priv *context)
{
	// device_tm1680_sysenable();
	tm1680_i2c_write_cmd(context, CMD_SYSEN_REG81);
	// device_tm1680_ledcyc_on();
	tm1680_i2c_write_cmd(context, CMD_LENON_REG83);
	// device_tm1680_oscmode(INNER_MODE0);
	tm1680_oscmode(context, OSC_INNER_MODE0);
	// device_tm1680_blink(HZ_0);
	tm1680_blink(context, BLINK_HZ_0);
	// device_tm1680_com_option(NMOS_8COM);
	tm1680_com_option(context, NMOS_8COM);
	// device_tm1680_contrast(context->contrast);
	tm1680_contrast(context, context->contrast);
	// write data
	tm1680_i2c_write_buffer(context, START_DATAREG, context->data, MAX_DATA_SIZE);

	printk("[TM1680] Chip initialize succeed\n");
	return 0;
}

static int tm1680_refresh(struct tm1680_priv *context, const u8 *data) {
	/*
	const u8 *diff_ptr = NULL;
	u8 diff_idx = 0;
	u8 diff_length = 0;
	u8 total_write = 0;
	int has_diff = 0;
	int has_write = 0;
	int i;

	for (i = 0; i < MAX_DATA_SIZE; i++) {
		if (context->data[i] != data[i]) {
			if (diff_ptr == NULL) {
				diff_ptr = &data[i];
				diff_idx = i;
				diff_length = 1;
			} else {
				diff_length++;
			}
			has_diff = 1;
			context->data[i] = data[i];
		} else {
			if (diff_ptr != NULL) {
				if (diff_length == 1)
					tm1680_i2c_write_value(context, START_DATAREG + diff_idx, *diff_ptr);
				else
					tm1680_i2c_write_buffer(context, START_DATAREG + diff_idx, diff_ptr, diff_length);
				total_write += diff_length;
				diff_ptr = NULL;
				diff_idx = 0;
				diff_length = 0;
				has_write = 1;
			}
		}
	}
	if (!has_diff)
		return 0;
	if (!has_write) {
		tm1680_i2c_write_buffer(context, START_DATAREG, data, MAX_DATA_SIZE);
		total_write += MAX_DATA_SIZE;
	}
	printk("[TM1680] Total %d bytes of display data has written\n", (int)total_write);
	return 0;
	*/

	tm1680_i2c_write_buffer(context, START_DATAREG, data, MAX_DATA_SIZE);
	memcpy(context->data, data, MAX_DATA_SIZE);
	printk("[TM1680] Total %d bytes of display data has written\n", MAX_DATA_SIZE);
	return 0;
}

/********************************************************************/
/// sysfs: front_led [write]
static int front_led_sysfs_write(struct device *dev, struct device_attribute *attr, const char *buf, size_t len)
{
	struct tm1680_priv *context = g_instance;
	int value = 0;

	if (len <= 0) {
		printk("[TM1680] Invalid value to 'front_led'\n");
		return len;
	}
	if (buf[0] == '0') {
		value = 0;
	} else if (buf[0] == '1') {
		value = 1;
	} else {
		printk("[TM1680] Invalid value to 'front_led'\n");
		return len;
	}
	mutex_lock(&context->lock);
	if (context->front_led != value) {
		gpio_set_value(FRONT_LED, value);
		context->front_led = value;
		if (value != 0)
			tm1680_init(context);
	}
	mutex_unlock(&context->lock);
	printk("[TM1680] Value of 'front_led' has changed to %d\n", value);

	return len;
}
static DEVICE_ATTR(front_led, S_IWUSR, NULL, front_led_sysfs_write);
/********************************************************************/

/********************************************************************/
/// sysfs: contrast [write]
static int contrast_sysfs_write(struct device *dev, struct device_attribute *attr, const char *buf, size_t len)
{
	struct tm1680_priv *context = g_instance;
	char *endp = NULL;
	int value = 0;

	if (len <= 0) {
		printk("[TM1680] Invalid value to 'contrast'\n");
		return len;
	}
	value = (int)simple_strtoul(buf, &endp, 0);
	if ((value < 0) || (value > 15)) {
		printk("[TM1680] Invalid value to 'contrast'\n");
		return len;
	}
	mutex_lock(&context->lock);
	if (context->contrast != value) {
		context->contrast = value;
		if (context->front_led != 0)
			tm1680_contrast(context, (u8)(value & 0x0F));
	}
	mutex_unlock(&context->lock);
	printk("[TM1680] Value of 'contrast' has changed to %d\n", value);

	return len;
}
static DEVICE_ATTR(contrast, S_IWUSR, NULL, contrast_sysfs_write);
/********************************************************************/

/********************************************************************/
/// sysfs: display_data [write]
static int display_data_sysfs_write(struct device *dev, struct device_attribute *attr, const char *buf, size_t len)
{
	struct tm1680_priv *context = g_instance;

	if (len < MAX_DATA_SIZE) {
		printk("[TM1680] Invalid value to 'display_data' (at least %d bytes required)\n", MAX_DATA_SIZE);
		return len;
	}
	mutex_lock(&context->lock);
	if (context->front_led == 0)
		memcpy(context->data, buf, MAX_DATA_SIZE);
	else
		tm1680_refresh(context, (const u8*)buf);
	mutex_unlock(&context->lock);
	printk("[TM1680] Value of 'display_data' has changed\n");

	return len;
}
static DEVICE_ATTR(display_data, S_IWUSR, NULL, display_data_sysfs_write);
/********************************************************************/

static int tm1680_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
{
	struct tm1680_priv *context = NULL;

	printk("[TM1680] Create driver context\n");

	// Allocate driver context
	context = (struct tm1680_priv *)kzalloc(sizeof(struct tm1680_priv), GFP_KERNEL);
	if (context == NULL) {
		printk("[TM1680] Failed to allocate memory\n");
		return -ENOMEM;
	}
	i2c_set_clientdata(i2c, context);
	g_instance = context;

	// Initialize variables
	context->client = i2c;
	mutex_init(&context->lock);
	context->front_led = 0;
	context->contrast = 2;
	memset(context->data, 0x00, sizeof(context->data));

	// Create sysfs
#define CREATE_SYSFS(name) \
	if (device_create_file(&i2c->dev, &dev_attr_##name) < 0) { \
		printk("[TM1680] Failed to create sysfs %s\n", #name); \
	}
	CREATE_SYSFS(front_led)
	CREATE_SYSFS(contrast)
	CREATE_SYSFS(display_data)
#undef CREATE_SYSFS

	// Request GPIO
	if (gpio_request(FRONT_LED, "FRONT_LED") != 0) {
		printk("[TM1680] Failed to request FRONT_LED GPIO(%d)\n", FRONT_LED);
		return -ENOSYS;
	}

	// Initialize chip
	gpio_direction_output(FRONT_LED, 0);
	mdelay(5);
	gpio_direction_output(FRONT_LED, 1);
	context->front_led = 1;
	tm1680_init(context);

	return 0;
}

static int tm1680_remove(struct i2c_client *client)
{
	struct tm1680_priv *context = (struct tm1680_priv *)i2c_get_clientdata(client);

	// Free memory
	g_instance = NULL;
	kfree(context);
	// Shutdown
	gpio_direction_output(FRONT_LED, 0);

	return 0;
}

static const struct of_device_id tm1680_of_match[] = {
	{ .compatible = "audcom,tm1680", },
	{ }
};
MODULE_DEVICE_TABLE(of, tm1680_of_match);

static const struct i2c_device_id tm1680_i2c_id[] = {
	{ "tm1680", 0 },
	{ }
};
MODULE_DEVICE_TABLE(i2c, tm1680_i2c_id);

static struct i2c_driver tm1680_i2c_driver = {
	.driver = {
		.name = "tm1680-i2c",
		.of_match_table = tm1680_of_match,
	},
	.probe = tm1680_probe,
	.remove = tm1680_remove,
	.id_table = tm1680_i2c_id,
};

module_i2c_driver(tm1680_i2c_driver);

MODULE_DESCRIPTION("TM1680 I2C driver");
MODULE_AUTHOR("Wang YuFei <Audcom, SZ>");
MODULE_LICENSE("GPL v2");

