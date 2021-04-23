#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

#ifdef RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("i2c:usb2512b");
MODULE_ALIAS("i2c:usb2512bi");
MODULE_ALIAS("i2c:usb2513b");
MODULE_ALIAS("i2c:usb2513bi");
MODULE_ALIAS("i2c:usb2514b");
MODULE_ALIAS("i2c:usb2514bi");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2512b");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2512bC*");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2512bi");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2512biC*");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2513b");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2513bC*");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2513bi");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2513biC*");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2514b");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2514bC*");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2514bi");
MODULE_ALIAS("of:N*T*Cmicrochip,usb2514biC*");
