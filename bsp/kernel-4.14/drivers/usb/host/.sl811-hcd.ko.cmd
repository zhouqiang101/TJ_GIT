cmd_drivers/usb/host/sl811-hcd.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/usb/host/sl811-hcd.ko drivers/usb/host/sl811-hcd.o drivers/usb/host/sl811-hcd.mod.o ;  true