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

MODULE_ALIAS("hid:b0003g0101v0000056Ap00000000");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000003");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000010");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000011");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000012");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000013");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000014");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000015");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000016");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000017");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000018");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000019");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000020");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000021");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000022");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000023");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000024");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000026");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000027");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000028");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000029");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000002A");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000030");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000031");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000032");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000033");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000034");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000035");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000037");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000038");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000039");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000003F");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000041");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000042");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000043");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000044");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000045");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000047");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000057");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000059");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000005B");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000005D");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000005E");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000060");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000061");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000062");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000063");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000064");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000065");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000069");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000006A");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000006B");
MODULE_ALIAS("hid:b0005g0101v0000056Ap00000081");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000084");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000090");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000093");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000097");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000009A");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000009F");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B0");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B1");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B2");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B3");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B4");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B5");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B7");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B8");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000B9");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000BA");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000BB");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000BC");
MODULE_ALIAS("hid:b0005g0101v0000056Ap000000BD");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000C0");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000C2");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000C4");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000C5");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000C6");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000C7");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000CC");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000CE");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D0");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D1");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D2");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D3");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D4");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D5");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D6");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D7");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000D8");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000DA");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000DB");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000DD");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000DE");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000DF");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000E2");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000E3");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000E5");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000E6");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000EC");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000ED");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000EF");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000F0");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000F4");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000F6");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000F8");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000FA");
MODULE_ALIAS("hid:b0003g0101v0000056Ap000000FB");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000100");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000101");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000010D");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000010E");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000010F");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000116");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000012C");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000300");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000301");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000302");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000303");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000304");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000307");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000309");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000030A");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000030C");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000030E");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000314");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000315");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000317");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000318");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000319");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000323");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000325");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000326");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000032A");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000032B");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000032C");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000032F");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000331");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000333");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000335");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000336");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000033B");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000033C");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000033D");
MODULE_ALIAS("hid:b0003g0101v0000056Ap0000033E");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00000343");
MODULE_ALIAS("hid:b0005g0101v0000056Ap00000360");
MODULE_ALIAS("hid:b0005g0101v0000056Ap00000361");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00004001");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00004004");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00005000");
MODULE_ALIAS("hid:b0003g0101v0000056Ap00005002");
MODULE_ALIAS("hid:b0003g*v000017EFp00006004");
MODULE_ALIAS("hid:b0003g0101v0000056Ap*");
MODULE_ALIAS("hid:b0018g0101v0000056Ap*");
MODULE_ALIAS("hid:b0005g0101v0000056Ap*");

MODULE_INFO(srcversion, "ECB7A2D1F16CF0C21B1C719");