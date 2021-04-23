cmd_drivers/usb/storage/uas.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/usb/storage/uas.ko drivers/usb/storage/uas.o drivers/usb/storage/uas.mod.o ;  true
