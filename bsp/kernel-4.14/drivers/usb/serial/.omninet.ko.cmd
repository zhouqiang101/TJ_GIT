cmd_drivers/usb/serial/omninet.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/usb/serial/omninet.ko drivers/usb/serial/omninet.o drivers/usb/serial/omninet.mod.o ;  true