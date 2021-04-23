cmd_fs/pstore/pstore.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/pstore/pstore.ko fs/pstore/pstore.o fs/pstore/pstore.mod.o ;  true
