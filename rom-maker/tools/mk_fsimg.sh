#!/bin/bash -u

function err_clean()
{
    echo "stop making ${RAW_FILE}"

    sync
    umount ${MNT_DIR}
    losetup -d ${LOOP_DEVICE}
    rm ${RAW_FILE}
    rm -rf ${MNT_DIR}
    exit 1
}

function runcmd()
{
    [ "$V" = "1" ] && echo "+ ${@}"
    eval $@ || {
        err_clean
    }
}

if [ $(id -u) -ne 0 ]; then
    echo "Error: Please run as root."
    exit 1
fi

# ----------------------------------------------------------
# base setup
true ${V:=0}
true ${TOP:=$(pwd)}
true ${FS_TYPE:=$1}
true ${RAW_FILE:=$2}
true ${DIR_BASE:=$3}
true ${RAW_SIZE_MB:=$4}
true ${LABEL:=$5}

if [ -z "${FS_TYPE}" -o -z "${RAW_FILE}" -o -z "${DIR_BASE}" -o -z "${DIR_BASE}" -o -z "${RAW_SIZE_MB}" -o -z "${LABEL}" ]; then
    echo "Usage: $0 <fs type> <output image> <directory> <size> <label>"
    exit 1
else
    echo "making ${RAW_SIZE_MB}MB ${RAW_FILE}..."
fi

trap 'err_clean' INT

# ----------------------------------------------------------
# Create zero file
blk_size=1024
let RAW_SIZE=(${RAW_SIZE_MB}*${blk_size})

if [ -f ${RAW_FILE} ]; then
    rm -f ${RAW_FILE}
fi

dd if=/dev/zero of=${RAW_FILE} bs=${blk_size} count=0 seek=${RAW_SIZE} >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: ${RAW_FILE}: Create RAW file failed"
    exit 1
fi

# ----------------------------------------------------------
# Setup loop device
LOOP_DEVICE=$(losetup -f)
if losetup ${LOOP_DEVICE} ${RAW_FILE}; then
    sleep 1
else
    echo "Error: attach ${LOOP_DEVICE} failed, stop now."
    rm ${RAW_FILE}
    exit 1
fi

# ----------------------------------------------------------
# Fusing all
case ${FS_TYPE} in
    vfat )
    runcmd "mkfs.${FS_TYPE} ${LOOP_DEVICE} -n ${LABEL} -I >/dev/null"
    RSYNC_OPTS="-a --no-o --no-g"
    ;;
    ext4 )
    runcmd "mkfs.${FS_TYPE} ${LOOP_DEVICE} -L ${LABEL} -q"
    RSYNC_OPTS="-a"
    ;;
    exfat )
    runcmd "mkfs.${FS_TYPE} ${LOOP_DEVICE} -n ${LABEL} >/dev/null"
    RSYNC_OPTS="-a --no-o --no-g"
    ;;
    * )
    err_clean
    ;;

esac

MNT_DIR=/tmp/media_${FS_TYPE}
rm -rf ${MNT_DIR} && mkdir -p ${MNT_DIR}
runcmd mount -t ${FS_TYPE} ${LOOP_DEVICE} ${MNT_DIR}

[ -d ${DIR_BASE} ] && rsync ${RSYNC_OPTS} ${DIR_BASE}/ /tmp/media_${FS_TYPE}/
RET=$?
sync && sleep 1

umount ${MNT_DIR}
umount ${RAW_FILE} >/dev/null 2>&1         # PC may automount boot.img
losetup -d ${LOOP_DEVICE} > /dev/null 2>&1

if [ ${RET} -ne 0 ]; then
    echo "Error: ${RAW_FILE}: Build ${RAW_FILE} failed"
    rm -f ${RAW_FILE}
    exit 1
else
    rm -rf ${MNT_DIR}
fi
