cmd_drivers/hid/hid-samsung.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-samsung.ko drivers/hid/hid-samsung.o drivers/hid/hid-samsung.mod.o ;  true
