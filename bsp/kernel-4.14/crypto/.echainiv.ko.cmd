cmd_crypto/echainiv.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o crypto/echainiv.ko crypto/echainiv.o crypto/echainiv.mod.o ;  true
