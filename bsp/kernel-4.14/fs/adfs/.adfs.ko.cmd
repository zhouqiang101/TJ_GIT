cmd_fs/adfs/adfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/adfs/adfs.ko fs/adfs/adfs.o fs/adfs/adfs.mod.o ;  true
