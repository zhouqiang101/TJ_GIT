cmd_drivers/rtc/rtc-sunxi.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/rtc/rtc-sunxi.ko drivers/rtc/rtc-sunxi.o drivers/rtc/rtc-sunxi.mod.o ;  true
