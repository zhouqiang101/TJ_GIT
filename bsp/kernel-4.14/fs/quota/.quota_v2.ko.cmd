cmd_fs/quota/quota_v2.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/quota/quota_v2.ko fs/quota/quota_v2.o fs/quota/quota_v2.mod.o ;  true
