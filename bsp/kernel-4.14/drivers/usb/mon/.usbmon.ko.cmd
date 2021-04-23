cmd_drivers/usb/mon/usbmon.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/usb/mon/usbmon.ko drivers/usb/mon/usbmon.o drivers/usb/mon/usbmon.mod.o ;  true
