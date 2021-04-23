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

MODULE_ALIAS("hid:b0018g*v00000B05p00008585");
MODULE_ALIAS("hid:b0018g*v00000B05p00000101");
MODULE_ALIAS("hid:b0003g*v00000B05p00001854");
MODULE_ALIAS("hid:b0003g*v00000B05p00001837");
MODULE_ALIAS("hid:b0003g*v00000B05p000017E0");
MODULE_ALIAS("hid:b0003g*v000004F2p00001125");
MODULE_ALIAS("hid:b0003g*v0000062Ap00005110");
MODULE_ALIAS("hid:b0003g*v00000C45p00005112");
MODULE_ALIAS("hid:b0005g*v00000B05p00008502");
