cmd_drivers/hid/hid-led.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-led.ko drivers/hid/hid-led.o drivers/hid/hid-led.mod.o ;  true
