cmd_fs/xfs/xfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/xfs/xfs.ko fs/xfs/xfs.o fs/xfs/xfs.mod.o ;  true
