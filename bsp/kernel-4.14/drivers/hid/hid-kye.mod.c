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

MODULE_ALIAS("hid:b0003g*v00000458p00000087");
MODULE_ALIAS("hid:b0003g*v00000458p00005010");
MODULE_ALIAS("hid:b0003g*v00000458p00005011");
MODULE_ALIAS("hid:b0003g*v00000458p0000501A");
MODULE_ALIAS("hid:b0003g*v00000458p00005013");
MODULE_ALIAS("hid:b0003g*v00000458p00000138");
MODULE_ALIAS("hid:b0003g*v00000458p00004018");
MODULE_ALIAS("hid:b0003g*v00000458p00000153");
MODULE_ALIAS("hid:b0003g*v00000458p00005015");
