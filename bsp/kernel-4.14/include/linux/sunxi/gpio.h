#ifndef _SUNXI_GPIO_HELPER_H
#define _SUNXI_GPIO_HELPER_H

#define PA_BASE 0
#define PB_BASE 32
#define PC_BASE 64
#define PD_BASE 96
#define PE_BASE 128
#define PF_BASE 160
#define PG_BASE 192
#define PH_BASE 224
#define PI_BASE 256
#define PL_BASE 352
#define PM_BASE 384
#define PN_BASE 416

#define _SUNXI_GPIO(bank, pin) \
	(P ## bank ## _BASE + (pin))

#endif
