cmd_fs/befs/befs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/befs/befs.ko fs/befs/befs.o fs/befs/befs.mod.o ;  true
