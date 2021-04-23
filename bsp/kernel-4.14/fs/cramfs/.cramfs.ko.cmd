cmd_fs/cramfs/cramfs.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/cramfs/cramfs.ko fs/cramfs/cramfs.o fs/cramfs/cramfs.mod.o ;  true
