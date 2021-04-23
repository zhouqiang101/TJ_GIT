cmd_fs/ceph/ceph.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o fs/ceph/ceph.ko fs/ceph/ceph.o fs/ceph/ceph.mod.o ;  true
