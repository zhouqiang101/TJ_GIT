cmd_drivers/usb/serial/option.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/option.ko drivers/usb/serial/option.o drivers/usb/serial/option.mod.o ;  true
