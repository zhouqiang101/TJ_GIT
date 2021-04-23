cmd_crypto/authenc.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o crypto/authenc.ko crypto/authenc.o crypto/authenc.mod.o ;  true
