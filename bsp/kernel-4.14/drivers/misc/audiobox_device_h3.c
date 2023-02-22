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

#define OUT_UNMUTE    _SUNXI_GPIO(A, 3)
#define SYS_ENABLED   _SUNXI_GPIO(A, 2)
#define REC_ENABLED   _SUNXI_GPIO(A, 6)
#define LOCAL_MIC_EN  _SUNXI_GPIO(A, 11)
#define MODEM_POWER   _SUNXI_GPIO(C, 3)

/********************************************************************/
/// sysfs: out_unmute [write]
static int out_unmute_sysfs_write(struct device *dev, struct device_attribute *attr, const char *buf, size_t len) {
	if (len <= 0) {
		return len;
	} else if (buf[0] == '0') {
		gpio_set_value(OUT_UNMUTE, 0);
		return len;
	} else if (buf[0] == '1') {
		gpio_set_value(OUT_UNMUTE, 1);
		return len;
	} else {
		printk("[HL_AUDIOBOX] Invalid use of out_unmute\n");
		return len;
	}
}
static DEVICE_ATTR(out_unmute, S_IWUSR, NULL, out_unmute_sysfs_write);
/********************************************************************/

/********************************************************************/
/// sysfs: sys_enabled [write]
static int sys_enabled_sysfs_write(struct device *dev, struct device_attribute *attr, const char *buf, size_t len) {
	if (len <= 0) {
		return len;
	} else if (buf[0] == '0') {
		gpio_set_value(SYS_ENABLED, 0);
		return len;
	} else if (buf[0] == '1') {
		gpio_set_value(SYS_ENABLED, 1);
		return len;
	} else {
		printk("[HL_AUDIOBOX] Invalid use of sys_enabled\n");
		return len;
	}
}
static DEVICE_ATTR(sys_enabled, S_IWUSR, NULL, sys_enabled_sysfs_write);
/********************************************************************/

/********************************************************************/
/// sysfs: rec_enabled [read]
static int rec_enabled_sysfs_read(struct device *dev, struct device_attribute *attr, char *buf) {
	sprintf(buf, "%d", gpio_get_value(REC_ENABLED));
	return strlen(buf);
}
static DEVICE_ATTR(rec_enabled, S_IRUGO, rec_enabled_sysfs_read, NULL);
/********************************************************************/

/********************************************************************/
/// sysfs: local_mic_en [read]
static int local_mic_en_sysfs_read(struct device *dev, struct device_attribute *attr, char *buf) {
	sprintf(buf, "%d", gpio_get_value(LOCAL_MIC_EN));
	return strlen(buf);
}
static DEVICE_ATTR(local_mic_en, S_IRUGO, local_mic_en_sysfs_read, NULL);
/********************************************************************/

/********************************************************************/
/// sysfs: lte_power [write]
static int lte_power_sysfs_write(struct device *dev, struct device_attribute *attr, const char *buf, size_t len) {
	if (len <= 0) {
		return len;
	} else if (buf[0] == '0') {
		gpio_set_value(MODEM_POWER, 0);
		return len;
	} else if (buf[0] == '1') {
		gpio_set_value(MODEM_POWER, 1);
		return len;
	} else {
		printk("[HL_AUDIOBOX] Invalid use of lte_power\n");
		return len;
	}
}
static DEVICE_ATTR(lte_power, S_IWUSR, NULL, lte_power_sysfs_write);
/********************************************************************/

static int audioboxdevice_probe(struct i2c_client *i2c, const struct i2c_device_id *id) {
	printk("[HL_AUDIOBOX] Initialize platform devices\n");

	// Request GPIOs
	/// OUT_UNMUTE
	if (gpio_request(OUT_UNMUTE, "OUT_UNMUTE") != 0) {
		printk("[HL_AUDIOBOX] Failed to request OUT_UNMUTE GPIO(%d)\n", OUT_UNMUTE);
		return -ENOSYS;
	}
	gpio_direction_output(OUT_UNMUTE, 1);  // Default is unmute
	/// SYS_ENABLED
	if (gpio_request(SYS_ENABLED, "SYS_ENABLED") != 0) {
		printk("[HL_AUDIOBOX] Failed to request SYS_ENABLED GPIO(%d)\n", SYS_ENABLED);
		return -ENOSYS;
	}
	gpio_direction_output(SYS_ENABLED, 1);  // Default is enabled
	/// REC_ENABLED
	if (gpio_request(REC_ENABLED, "REC_ENABLED") != 0) {
		printk("[HL_AUDIOBOX] Failed to request REC_ENABLED GPIO(%d)\n", REC_ENABLED);
		return -ENOSYS;
	}
	gpio_direction_input(REC_ENABLED);
	/// LOCAL_MIC_EN
	if (gpio_request(LOCAL_MIC_EN, "LOCAL_MIC_EN") != 0) {
		printk("[HL_AUDIOBOX] Failed to request LOCAL_MIC_EN GPIO(%d)\n", LOCAL_MIC_EN);
		return -ENOSYS;
	}
	gpio_direction_input(LOCAL_MIC_EN);
	/// MODEM_POWER
	if (gpio_request(MODEM_POWER, "MODEM_POWER") != 0) {
		printk("[HL_AUDIOBOX] Failed to request MODEM_POWER GPIO(%d)\n", MODEM_POWER);
		return -ENOSYS;
	}
	gpio_direction_output(MODEM_POWER, 1);  // Default is on

	// Create sysfs
#define CREATE_SYSFS(name) \
	if (device_create_file(&i2c->dev, &dev_attr_##name) < 0) { \
		printk("[HL_AUDIOBOX] Failed to create sysfs %s\n", #name); \
	}
	CREATE_SYSFS(out_unmute)
	CREATE_SYSFS(sys_enabled)
	CREATE_SYSFS(rec_enabled)
	CREATE_SYSFS(local_mic_en)
	CREATE_SYSFS(lte_power)
#undef CREATE_SYSFS

	return 0;
}

static int audioboxdevice_remove(struct i2c_client *client) {
	// Power-down system
	gpio_set_value(OUT_UNMUTE, 0);  // Mute output
	gpio_set_value(SYS_ENABLED, 1);  // System enabled
	gpio_set_value(MODEM_POWER, 0);  // Power-off modem

	return 0;
}

static const struct of_device_id audioboxdevice_of_match[] = {
	{ .compatible = "hl,audiobox", },
	{ }
};
MODULE_DEVICE_TABLE(of, audioboxdevice_of_match);

static const struct i2c_device_id audioboxdevice_i2c_id[] = {
	{ "audioboxdevice", 0 },
	{ }
};
MODULE_DEVICE_TABLE(i2c, audioboxdevice_i2c_id);

static struct i2c_driver audioboxdevice_i2c_driver = {
	.driver = {
		.name = "audioboxdevice-i2c",
		.of_match_table = audioboxdevice_of_match,
	},
	.probe = audioboxdevice_probe,
	.remove = audioboxdevice_remove,
	.id_table = audioboxdevice_i2c_id,
};

module_i2c_driver(audioboxdevice_i2c_driver);

MODULE_DESCRIPTION("ASoC HL-AudioBox device driver");
MODULE_AUTHOR("Wang YuFei <At-Com, SZ>");
MODULE_LICENSE("GPL v2");