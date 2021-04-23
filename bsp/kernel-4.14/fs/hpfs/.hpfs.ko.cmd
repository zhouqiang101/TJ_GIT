cmd_fs/hpfs/hpfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/hpfs/hpfs.ko fs/hpfs/hpfs.o fs/hpfs/hpfs.mod.o ;  true
