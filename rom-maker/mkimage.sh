#!/bin/bash -eu

source ./tools/global.sh

function cal_size()
{
    DBG_INFO "$FUNCNAME" $@

    case ${FS_TYPE} in
        1|3 )
            PART1_SIZE=$(( `grep "boot.img" ${PARTMAP} | cut -f 4 -d":" | cut -f 2 -d","`/1024/1024 ))
            # rootfs.img's size = rootfs directory size + ext4 data size, so we take: (${PART2_DIR} + 100)*5/4
            PART2_SIZE=$(( (`du -s --apparent-size ${PART2_DIR} | cut -f 1`/1024 + 100) * 5 / 4))
            RAW_SIZE_MB=$(( MISC_SIZE+PART1_SIZE+PART2_SIZE ))
            ;;
        2 )
            PART1_SIZE=$(( `grep "boot.img" ${PARTMAP} | cut -f 4 -d":" | cut -f 2 -d","`/1024/1024 ))
            PART2_SIZE=$(( `grep "rootfs.img" ${PARTMAP} | cut -f 4 -d":" | cut -f 2 -d","`/1024/1024 ))
            # app.img's size = SD-bootable directory size + ext4 data size, so we take: (${PART3_DIR} + 100)*5/4
            PART3_SIZE=$(( (`du -s --apparent-size ${PART3_DIR} | cut -f 1`/1024 + 100) * 5 / 4))
            RAW_SIZE_MB=$(( MISC_SIZE+PART1_SIZE+PART2_SIZE+PART3_SIZE ))
            ;;
        * )
            pt_error "Unsupported prepare type"
            Usage
            ;;
    esac
}

# Create filesystem image Gernerate Layer
function create_fs()
{
    DBG_INFO "$FUNCNAME" $@

    case ${FS_TYPE} in
        1)
            run_cmd "./tools/create_fs/create1.sh ${OUT} ${PARTMAP} ${MISC_DIR} ${MISC_SIZE} ${PART1_DIR} ${PART1_SIZE} ${PART2_DIR} ${PART2_SIZE} ${BLK_DEV}"
            ;;
        2)
            run_cmd "./tools/create_fs/create2.sh ${OUT} ${PARTMAP} ${MISC_DIR} ${MISC_SIZE} ${PART1_DIR} ${PART1_SIZE} ${PART2_DIR} ${PART2_SIZE} ${PART3_DIR} ${PART3_SIZE} ${BLK_DEV}"
            ;;
        3)
            run_cmd "./tools/create_fs/create3.sh ${OUT} ${PARTMAP} ${MISC_DIR} ${MISC_SIZE} ${PART1_DIR} ${PART1_SIZE} ${PART2_DIR} ${PART2_SIZE} ${BLK_DEV}"
            ;;
    esac
    gen_conf
    if [ "x${BLK_DEV}" != "xunset" ]; then
        pt_info "Backup ${BLK_DEV} system done.Please run: cp -rv out/SD-bootable-${FS_TYPE}/${COMPANY} /mnt/sdcard/ && reboot" && exit 1
    fi
}

function create_zfile()
{
    DBG_INFO "$FUNCNAME" $@

    let blk_size=1024
    let raw_size=(${RAW_SIZE_MB}*1024*1024)/${blk_size}

    rm -f ${RAW_FILE_PATH}
    run_cmd "dd if=/dev/zero of=${RAW_FILE_PATH} bs=${blk_size} count=0 seek=${raw_size} >/dev/null 2>&1"

    sfdisk -u S -q ${RAW_FILE_PATH} >/dev/null << EOF
2048,,0x0C,-
EOF
    if [ $? -ne 0 ]; then
        echo "Error: ${RAW_FILE_PATH}: Create RAW file failed"
        exit 1
    fi
}

function gen_conf()
{
    DBG_INFO "$FUNCNAME" $@

    local cpu=`grep CPU= ${PARTMAP} | cut -d = -f 2`
    cat << EOF > ${OUT}/info.conf
title=${COMPANY}
require-board=${cpu}
version=`date "+%Y-%m-%d"`
EOF
}

function fill_file()
{
    pt_info "Making ${RAW_SIZE_MB}MB ${RAW_IMG}..."

    local loop_dev=$(losetup -f)
    if losetup ${loop_dev} ${RAW_FILE_PATH}; then
        sleep 1
    else
        echo "Error: attach ${loop_dev} failed, stop now."
        rm -f ${RAW_FILE_PATH}
        exit 1
    fi

    ./tools/sd_update -d ${loop_dev} -p ${OUT}/partmap.txt >/dev/null
    if [ $? -ne 0 ]; then
         losetup -d ${loop_dev}
         echo "fail to ./tools/sd_update -d ${loop_dev} -p ${OUT}/partmap.txt, stop now"
         exit 1
    fi

    losetup -d ${loop_dev} &> /dev/null
    pt_info "OK"
    mv ${OUT}/${RAW_IMG} ${OUT}/../../
}

function parse_arg()
{
    DBG_INFO "$FUNCNAME" $@

    if [ $# -lt 4 ];then
        pt_error "invalid param" && Usage
    else
        while getopts "c:m:d:B:C:" opt; do
            case $opt in
                c ) FS_TYPE=$OPTARG;;
                m ) PARTMAP=$OPTARG;;
                d ) ALL_DIR=$OPTARG;;
                B ) BLK_DEV=$OPTARG;;
                C ) CHECK_FILELIST=$OPTARG;;
                * ) Usage ;;
            esac
        done
        if [ ! -e "${PARTMAP}" ]; then
            pt_error "file not found: ${PARTMAP}" && exit 1
        fi

        MISC_DIR=`echo ${ALL_DIR} | cut -d ";" -f 1`
        MISC_SIZE=$(( `grep "boot.img" ${PARTMAP} | cut -f 4 -d":" | cut -f 1 -d","`/1024/1024 ))
        case ${FS_TYPE} in
        1|3 )
            PART1_DIR=`echo ${ALL_DIR} | cut -d ";" -f 2`
            PART2_DIR=`echo ${ALL_DIR} | cut -d ";" -f 3`
            check_dir ${MISC_DIR} && check_dir ${PART1_DIR} && check_dir ${PART2_DIR}
            [ -b "${BLK_DEV}" ] || check_file ${MISC_DIR}
            [ -b "${BLK_DEV}" ] || check_file ${PART1_DIR}
            ;;
        2 )
            PART1_DIR=`echo ${ALL_DIR} | cut -d ";" -f 2`
            PART2_DIR=`echo ${ALL_DIR} | cut -d ";" -f 3`
            PART3_DIR=`echo ${ALL_DIR} | cut -d ";" -f 4`
            check_dir ${MISC_DIR} && check_dir ${PART1_DIR} && check_dir ${PART2_DIR} && check_dir ${PART3_DIR}
            [ -b "${BLK_DEV}" ] || check_file ${MISC_DIR}
            [ -b "${BLK_DEV}" ] || check_file ${PART1_DIR}
            ;;
        * )
            pt_error "Unsupported prepare type"
            Usage
        ;;
        esac
    fi
}

if [ $(id -u) -ne 0 ]; then
    echo "Error: Please run as root."
    exit 1
fi

DBG_INFO filename $0
RML_PRJ=`pwd`
export RML_PRJ
BLK_DEV="unset"
CHECK_FILELIST="no"

parse_arg $@
export CHECK_FILELIST

RAW_IMG=SD-bootable-${FS_TYPE}.img
COMPANY="HeardLearn"
OUT=./out/SD-bootable-${FS_TYPE}/${COMPANY}
RAW_FILE_PATH=${OUT}/${RAW_IMG}
RAW_SIZE_MB="unset"
mkdir -p ${OUT}
rm ./${OUT}/* -rf && rm ./out/${RAW_IMG} -f && sync

cal_size
create_fs
create_zfile
fill_file
exit 0
