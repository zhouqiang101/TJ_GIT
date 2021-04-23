cmd_drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.o := arm-linux-gcc -Wp,-MD,drivers/net/wireless/rtl8821cu/os_dep/linux/.rtw_rhashtable.o.d  -nostdinc -isystem /usr/local/arm/5.4.0/bin/../lib/gcc/arm-none-linux-gnueabi/5.4.0/include -I./arch/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -O1 -Wno-unused-variable -Wno-unused-value -Wno-unused-label -Wno-unused-parameter -Wno-unused-function -Wno-unused -Wno-date-time -Idrivers/net/wireless/rtl8821cu/include -Idrivers/net/wireless/rtl8821cu/platform -Idrivers/net/wireless/rtl8821cu/hal/btc -DCONFIG_MP_INCLUDED -DCONFIG_POWER_SAVING -DCONFIG_BT_COEXIST -DCONFIG_EFUSE_CONFIG_FILE -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8821cu.map\" -DWIFIMAC_PATH=\"/data/wifimac.txt\" -DCONFIG_LOAD_PHY_PARA_FROM_FILE -DREALTEK_CONFIG_PATH=\"/lib/firmware/\" -DCONFIG_TXPWR_BY_RATE_EN=1 -DCONFIG_TXPWR_LIMIT_EN=0 -DCONFIG_RTW_ADAPTIVITY_EN=0 -DCONFIG_RTW_ADAPTIVITY_MODE=0 -DHIGH_ACTIVE_HST2DEV=0 -DCONFIG_BR_EXT '-DCONFIG_BR_EXT_BRNAME="'br0'"' -DCONFIG_RTW_NAPI -DCONFIG_RTW_GRO -DCONFIG_RTW_NETIF_SG -DCONFIG_RTW_DEBUG -DRTW_LOG_LEVEL=4 -DDM_ODM_SUPPORT_TYPE=0x04 -DCONFIG_LITTLE_ENDIAN -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -Idrivers/net/wireless/rtl8821cu/hal/phydm -DCONFIG_RTL8821C  -DMODULE  -DKBUILD_BASENAME='"rtw_rhashtable"'  -DKBUILD_MODNAME='"8821cu"' -c -o drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.o drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.c

source_drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.o := drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.c

deps_drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.o := \
    $(wildcard include/config/rtw/mesh.h) \
    $(wildcard include/config/mmu.h) \
  include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \

drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.o: $(deps_drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.o)

$(deps_drivers/net/wireless/rtl8821cu/os_dep/linux/rtw_rhashtable.o):
