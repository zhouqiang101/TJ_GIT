cmd_fs/ufs/ufs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/ufs/ufs.ko fs/ufs/ufs.o fs/ufs/ufs.mod.o ;  true
