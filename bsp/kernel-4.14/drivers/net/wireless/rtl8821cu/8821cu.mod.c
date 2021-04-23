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

MODULE_ALIAS("usb:v0BDApB82Bd*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApB820d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC821d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC820d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC82Ad*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC82Bd*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC811d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDAp8811d*dc*dsc*dp*icFFiscFFipFFin*");

MODULE_INFO(srcversion, "8166AF9DBABBE03ADD60FA5");
