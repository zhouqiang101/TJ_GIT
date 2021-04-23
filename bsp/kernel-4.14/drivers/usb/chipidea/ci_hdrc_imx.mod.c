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
"depends=usbmisc_imx,ci_hdrc";

MODULE_ALIAS("of:N*T*Cfsl,imx23-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx23-usbC*");
MODULE_ALIAS("of:N*T*Cfsl,imx28-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx28-usbC*");
MODULE_ALIAS("of:N*T*Cfsl,imx27-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx27-usbC*");
MODULE_ALIAS("of:N*T*Cfsl,imx6q-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx6q-usbC*");
MODULE_ALIAS("of:N*T*Cfsl,imx6sl-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx6sl-usbC*");
MODULE_ALIAS("of:N*T*Cfsl,imx6sx-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx6sx-usbC*");
MODULE_ALIAS("of:N*T*Cfsl,imx6ul-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx6ul-usbC*");
MODULE_ALIAS("of:N*T*Cfsl,imx7d-usb");
MODULE_ALIAS("of:N*T*Cfsl,imx7d-usbC*");
