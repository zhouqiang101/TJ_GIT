cmd_fs/hfsplus/hfsplus.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/hfsplus/hfsplus.ko fs/hfsplus/hfsplus.o fs/hfsplus/hfsplus.mod.o ;  true
