cmd_fs/afs/kafs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/afs/kafs.ko fs/afs/kafs.o fs/afs/kafs.mod.o ;  true
