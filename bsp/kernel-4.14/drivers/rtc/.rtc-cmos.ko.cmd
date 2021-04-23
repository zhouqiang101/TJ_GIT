cmd_drivers/rtc/rtc-cmos.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/rtc/rtc-cmos.ko drivers/rtc/rtc-cmos.o drivers/rtc/rtc-cmos.mod.o ;  true
