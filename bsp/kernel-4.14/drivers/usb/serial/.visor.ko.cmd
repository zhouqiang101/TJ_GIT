cmd_drivers/usb/serial/visor.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/visor.ko drivers/usb/serial/visor.o drivers/usb/serial/visor.mod.o ;  true
