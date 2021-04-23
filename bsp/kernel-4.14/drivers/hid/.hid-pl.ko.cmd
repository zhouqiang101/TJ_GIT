cmd_drivers/hid/hid-pl.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-pl.ko drivers/hid/hid-pl.o drivers/hid/hid-pl.mod.o ;  true
