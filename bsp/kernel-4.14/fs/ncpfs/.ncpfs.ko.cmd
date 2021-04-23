cmd_fs/ncpfs/ncpfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/ncpfs/ncpfs.ko fs/ncpfs/ncpfs.o fs/ncpfs/ncpfs.mod.o ;  true
