cmd_lib/zstd/zstd_compress.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o lib/zstd/zstd_compress.ko lib/zstd/zstd_compress.o lib/zstd/zstd_compress.mod.o ;  true
