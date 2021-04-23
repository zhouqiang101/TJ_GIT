cmd_fs/affs/affs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/affs/affs.ko fs/affs/affs.o fs/affs/affs.mod.o ;  true
