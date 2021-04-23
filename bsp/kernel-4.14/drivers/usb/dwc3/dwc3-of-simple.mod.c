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

MODULE_ALIAS("of:N*T*Cqcom,dwc3");
MODULE_ALIAS("of:N*T*Cqcom,dwc3C*");
MODULE_ALIAS("of:N*T*Crockchip,rk3399-dwc3");
MODULE_ALIAS("of:N*T*Crockchip,rk3399-dwc3C*");
MODULE_ALIAS("of:N*T*Cxlnx,zynqmp-dwc3");
MODULE_ALIAS("of:N*T*Cxlnx,zynqmp-dwc3C*");
MODULE_ALIAS("of:N*T*Ccavium,octeon-7130-usb-uctl");
MODULE_ALIAS("of:N*T*Ccavium,octeon-7130-usb-uctlC*");
MODULE_ALIAS("of:N*T*Csprd,sc9860-dwc3");
MODULE_ALIAS("of:N*T*Csprd,sc9860-dwc3C*");
