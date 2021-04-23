cmd_fs/cachefiles/cachefiles.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/cachefiles/cachefiles.ko fs/cachefiles/cachefiles.o fs/cachefiles/cachefiles.mod.o ;  true
