#!/bin/bash

source ${RML_PRJ}/tools/global.sh

function extract_blk_misc()
{
    local rawfile=`grep :raw: ${PARTMAP} | awk -F':' '{print $NF}' | sed 's/;//g'`
    for f in ${rawfile}; do
        local start=`grep ${f} ${PARTMAP} | cut -d: -f 4 | cut -d, -f1 | sed 's/0x//g'`
        start=`echo $((16#${start}))`
        local size=`grep ${f} ${PARTMAP} | cut -d: -f 4 | cut -d, -f2 | sed 's/0x//g'`
        size=`echo $((16#${size}))`
        run_cmd "dd if=${BLK_DEV} bs=1k skip=$(( ${start}/1024 )) count=$(( ${size}/1024 )) of=${MISC_DIR}/${f}"
    done
}

DBG_INFO filename $0
OUT=$1
PARTMAP=$2
MISC_DIR=$3
MISC_SZ=$4
PART1_DIR=$5
PART1_SZ=$6
PART2_DIR=$7
PART2_SZ=$8
BLK_DEV=$9

PART1_LB=`grep "boot.img" ${PARTMAP} | cut -f 2 -d :`
PART2_LB=`grep "rootfs.img" ${PARTMAP} | cut -f 2 -d :`
pt_info "Creating ${MISC_SZ}MB misc + ${PART1_SZ}MB fat32 ${PART1_LB}.img + ${PART2_SZ}MB ext4 ${PART2_LB}.img..."
if [ -b "${BLK_DEV}" ]; then
    echo "Extracting misc raw file from ${BLK_DEV}..."
    extract_blk_misc
fi

run_cmd "cp -rf ${MISC_DIR}/* ${OUT}/"
run_cmd "cp -rf ${PARTMAP} ${OUT}/"
run_cmd "./tools/mk_fsimg.sh vfat ${OUT}/boot.img ${PART1_DIR} ${PART1_SZ} ${PART1_LB}"
run_cmd "./tools/mk_fsimg.sh ext4 ${OUT}/rootfs.img ${PART2_DIR} ${PART2_SZ} ${PART2_LB}"
