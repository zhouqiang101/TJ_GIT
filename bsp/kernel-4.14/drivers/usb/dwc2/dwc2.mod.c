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

MODULE_ALIAS("of:N*T*Cbrcm,bcm2835-usb");
MODULE_ALIAS("of:N*T*Cbrcm,bcm2835-usbC*");
MODULE_ALIAS("of:N*T*Chisilicon,hi6220-usb");
MODULE_ALIAS("of:N*T*Chisilicon,hi6220-usbC*");
MODULE_ALIAS("of:N*T*Crockchip,rk3066-usb");
MODULE_ALIAS("of:N*T*Crockchip,rk3066-usbC*");
MODULE_ALIAS("of:N*T*Clantiq,arx100-usb");
MODULE_ALIAS("of:N*T*Clantiq,arx100-usbC*");
MODULE_ALIAS("of:N*T*Clantiq,xrx200-usb");
MODULE_ALIAS("of:N*T*Clantiq,xrx200-usbC*");
MODULE_ALIAS("of:N*T*Csnps,dwc2");
MODULE_ALIAS("of:N*T*Csnps,dwc2C*");
MODULE_ALIAS("of:N*T*Csamsung,s3c6400-hsotg");
MODULE_ALIAS("of:N*T*Csamsung,s3c6400-hsotgC*");
MODULE_ALIAS("of:N*T*Camlogic,meson8-usb");
MODULE_ALIAS("of:N*T*Camlogic,meson8-usbC*");
MODULE_ALIAS("of:N*T*Camlogic,meson8b-usb");
MODULE_ALIAS("of:N*T*Camlogic,meson8b-usbC*");
MODULE_ALIAS("of:N*T*Camlogic,meson-gxbb-usb");
MODULE_ALIAS("of:N*T*Camlogic,meson-gxbb-usbC*");
MODULE_ALIAS("of:N*T*Camcc,dwc-otg");
MODULE_ALIAS("of:N*T*Camcc,dwc-otgC*");
MODULE_ALIAS("of:N*T*Cst,stm32f4x9-fsotg");
MODULE_ALIAS("of:N*T*Cst,stm32f4x9-fsotgC*");
MODULE_ALIAS("of:N*T*Cst,stm32f4x9-hsotg");
MODULE_ALIAS("of:N*T*Cst,stm32f4x9-hsotgC*");
