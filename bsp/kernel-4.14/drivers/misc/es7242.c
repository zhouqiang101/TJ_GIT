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
#include <linux/sunxi/gpio.h>

#define AUDIO_MODE_NONE   0
#define AUDIO_MODE_LOCAL  1
#define AUDIO_MODE_BT     2
#define AUDIO_MODE_JACK   3
#define AUDIO_MODE_JK1    4
#define AUDIO_MODE_JK2    5

static const u8 adcSel[6] =
{
	0x11,  // None (DO NOT USE)
	0x18|0x12,  // Local + Jack
	0x18|0x14,  // Local + BT
	0x12,	//JACK  aux
	0x18,   // Local  network
	0x14	//BT 
};
static const char* adcSelName[6] =
{
	"NONE",
	"LOCAL+JACK",
	"LOCAL+BT",
	"JACK",
	"LOCAL",
	"BT"
};

struct es7242_priv {
	struct i2c_client *client;
	struct mutex lock;
	int chip_inited;
	int audio_select;
};

/// Global unique instance
static struct es7242_priv
	*_es7242_unique_inst = NULL;

static int es7242_i2c_read(struct es7242_priv *data, u8 reg)
{
	struct i2c_client *client = data->client;
	int ret;

	ret = i2c_smbus_read_byte_data(client, reg);
	if (ret < 0) {
		return -1;
	}
	return ret & 0xFF;
}

static int es7242_i2c_write(struct es7242_priv *data, u8 reg, u8 value)
{
	struct i2c_client *client = data->client;
	int ret;

	ret = i2c_smbus_write_byte_data(client, reg, value);
	return ret;
}

static void switchAudio(struct es7242_priv *p, int mode)
{
	es7242_i2c_write(p, 0x08, adcSel[mode]);	//2020年9月28日16点04分
	//es7242_i2c_write(p, 0x08, 0x1f);		//测试4路混音
	printk("[ES7242] Audio changed to '%s'\n",
		adcSelName[p->audio_select]);
}

static void initAudioSwitcher(struct es7242_priv *p)
{
	int chipID;

	printk("[ES7242] Initialize chip\n");

	chipID = es7242_i2c_read(p, 0x0E);
	if (chipID == -1) {
		printk("[ES7242] Failed to read chip ID");
		return;
	}
	printk("[ES7242] Chip ID = 0x%X\n", chipID);

	es7242_i2c_write(p, 0x06, 0x18);
	es7242_i2c_write(p, 0x01, 0x00);
	es7242_i2c_write(p, 0x08, adcSel[p->audio_select]);
	es7242_i2c_write(p, 0x05, 0x13);
	es7242_i2c_write(p, 0x06, 0x00);
	es7242_i2c_write(p, 0x00, 0x03);
	printk("[ES7242] Audio select '%s'\n",
		adcSelName[p->audio_select]);
	printk("[ES7242] Chip initialized\n");
}

/********************************************************************/
/// sysfs: init_chip [write]
static int init_chip_sysfs_write(struct device *dev,
	struct device_attribute *attr, const char *buf, size_t len)
{
	struct es7242_priv *data = _es7242_unique_inst;

	if (len <= 0) {
		return len;
	}
	if (buf[0] != '1') {
		return len;
	}

	mutex_lock(&data->lock);
	initAudioSwitcher(data);
	data->chip_inited = 1;
	mutex_unlock(&data->lock);

	return len;
}
static DEVICE_ATTR(init_chip, S_IWUSR,
	NULL, init_chip_sysfs_write);
/********************************************************************/

/********************************************************************/
/// sysfs: audio_sel [read, write]
static int audio_sel_sysfs_read(struct device *dev,
	struct device_attribute *attr, char *buf)
{
	struct es7242_priv *data = _es7242_unique_inst;

	sprintf(buf, "%d", data->audio_select);
	return strlen(buf);
}
static int audio_sel_sysfs_write(struct device *dev,
	struct device_attribute *attr, const char *buf, size_t len)
{
	struct es7242_priv *data = _es7242_unique_inst;
	int newMode = 0;

	if (len <= 0) {
		return len;
	}
	if (buf[0] == '0') {
		newMode = AUDIO_MODE_NONE;
	}
	else if (buf[0] == '1') {
		newMode = AUDIO_MODE_LOCAL;
	}
	else if (buf[0] == '2') {
		newMode = AUDIO_MODE_BT;
	}
	else if (buf[0] == '3') {
		newMode = AUDIO_MODE_JACK;
	}
	else if (buf[0] == '4') {
		newMode = AUDIO_MODE_JK1;
	}
	else if (buf[0] == '5') {
		newMode = AUDIO_MODE_JK2;
	}
	else {
		return len;
	}

	mutex_lock(&data->lock);
	data->audio_select = newMode;
	if (!data->chip_inited) {
		initAudioSwitcher(data);
		data->chip_inited = 1;
	}
	switchAudio(data, newMode);
	mutex_unlock(&data->lock);

	return len;
}
static DEVICE_ATTR(audio_sel, S_IRUGO | S_IWUSR,
	audio_sel_sysfs_read, audio_sel_sysfs_write);
/********************************************************************/

static int es7242_probe(struct i2c_client *i2c,
	const struct i2c_device_id *id)
{
	struct es7242_priv *data = NULL;

	printk("[HL_AUDIOBOX] Create es7242 context\n");

	// Allocate driver data
	data = (struct es7242_priv *)kzalloc(
		sizeof(struct es7242_priv), GFP_KERNEL);
	if (data == NULL) {
		printk("[HL_AUDIOBOX] Failed to allocate memory\n");
		return -ENOMEM;
	}
	i2c_set_clientdata(i2c, data);
	_es7242_unique_inst = data;

	// Initialize variables
	data->client = i2c;
	mutex_init(&data->lock);
	data->chip_inited = 0;
	data->audio_select = AUDIO_MODE_NONE;

	// Create sysfs
#define CREATE_SYSFS(name) \
	if (device_create_file(&i2c->dev, &dev_attr_##name) < 0) { \
		printk("[HL_AUDIOBOX] Failed to create sysfs %s\n", #name); \
	}
	/// Driver sysfs
	CREATE_SYSFS(init_chip)
	CREATE_SYSFS(audio_sel)
#undef CREATE_SYSFS

        return 0;
}

static int es7242_remove(struct i2c_client *client)
{
	struct es7242_priv *data =
		(struct es7242_priv *)i2c_get_clientdata(client);

	// Free memory
	_es7242_unique_inst = NULL;
	kfree(data);

	return 0;
}

static const struct of_device_id es7242_of_match[] = {
	{ .compatible = "es,es7242", },
	{ }
};
MODULE_DEVICE_TABLE(of, es7242_of_match);

static const struct i2c_device_id es7242_i2c_id[] = {
	{ "es7242", 0 },
	{ }
};
MODULE_DEVICE_TABLE(i2c, es7242_i2c_id);

static struct i2c_driver es7242_i2c_driver = {
	.driver = {
		.name = "es7242-i2c",
		.of_match_table = es7242_of_match,
	},
	.probe = es7242_probe,
	.remove = es7242_remove,
	.id_table = es7242_i2c_id,
};

module_i2c_driver(es7242_i2c_driver);

MODULE_DESCRIPTION("ES7242 I2C driver");
MODULE_AUTHOR("Wang YuFei <At-Com, SZ>");
MODULE_LICENSE("GPL v2");
