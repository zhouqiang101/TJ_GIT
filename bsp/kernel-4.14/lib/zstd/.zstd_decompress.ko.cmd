cmd_lib/zstd/zstd_decompress.ko := arm-linux-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o lib/zstd/zstd_decompress.ko lib/zstd/zstd_decompress.o lib/zstd/zstd_decompress.mod.o ;  true
