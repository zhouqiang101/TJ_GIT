cmd_fs/omfs/omfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/omfs/omfs.ko fs/omfs/omfs.o fs/omfs/omfs.mod.o ;  true
