cmd_drivers/net/usb/usbnet.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/net/usb/usbnet.ko drivers/net/usb/usbnet.o drivers/net/usb/usbnet.mod.o ;  true
