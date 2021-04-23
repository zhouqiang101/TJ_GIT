cmd_drivers/hid/hid-alps.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/hid/hid-alps.ko drivers/hid/hid-alps.o drivers/hid/hid-alps.mod.o ;  true
