cmd_crypto/deflate.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o crypto/deflate.ko crypto/deflate.o crypto/deflate.mod.o ;  true
