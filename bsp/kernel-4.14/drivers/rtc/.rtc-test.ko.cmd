cmd_drivers/rtc/rtc-test.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/rtc/rtc-test.ko drivers/rtc/rtc-test.o drivers/rtc/rtc-test.mod.o ;  true
