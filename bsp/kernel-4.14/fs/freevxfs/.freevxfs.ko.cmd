cmd_fs/freevxfs/freevxfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/freevxfs/freevxfs.ko fs/freevxfs/freevxfs.o fs/freevxfs/freevxfs.mod.o ;  true
