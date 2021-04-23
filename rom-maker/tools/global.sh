#!/bin/bash -eu

function pt_error()
{
    local now=`date +%s`
    printf "\033[1;31m[ERROR%4s]: $*\033[0m \n" $((now-START_TIME))
}

function pt_warn()
{
    local now=`date +%s`
    printf "\033[1;31m[WARN%5s]: $*\033[0m \n" $((now-START_TIME))
}

function pt_info()
{
    local now=`date +%s`
    printf "\033[1;32m[INFO%5s]: $* \033[0m \n" $((now-START_TIME))
}

function run_cmd()
{
    if [ "x${DEBUG}" = "xyes" ]; then
        pt_info "                =>cmd: ${@}"
    fi

    eval $@
    local ret=$?
    if [ ${ret} -ne 0 ]; then
        pt_error "fail to run command \"$@\" "
        exit  ${ret}
    fi
}

function DBG_INFO()
{
    if [ "x${DEBUG}" = "xyes" ]; then
        if [ "x${1}" = "xfilename" ]; then
            pt_warn "=>file: ${2}"
        else
            pt_info "        =>func: $@"
        fi
    fi
}

function Usage()
{
    echo "./mkimage.sh -c <filesystem type> -m <partmap> -d \"<misc dir>;<partition1 dir>;<partition2 dir>;...\""
    echo "  -c <filesystem type>:"
    echo "      1: misc(bootloader) + fat32 boot.img + ext4 rootfs.img"
    echo "      2: misc(bootloader) + fat32 boot.img + ext4 rootfs.img + ext4 app.img"
    echo "      3: misc(bootloader) +  ext4 boot.img + ext4 rootfs.img"
    exit 1
}

function check_dir()
{
    local dir=${1}
    if [ -z "${dir}" ] || [ "${dir}" = "/" ]; then
        pt_error "invalid directory path: \"${dir}\"" && exit 1
    fi

    if [ ! -e "${dir}" ]; then
        pt_error "directory not found. Please check if ${dir} exist" && exit 1
    fi
}

function check_file()
{
    if [ "x${CHECK_FILELIST}" = 'xyes' ]; then
        local mdir=${1}
        if [ -e "${mdir}/.filelist" ]; then
            for file in `cat ${mdir}/.filelist`; do
                if [[ x${file} =~ x#* ]] || [[ x${file} =~ x$* ]]; then
                    continue
                fi
                if ! ls ${mdir}/${file}>/dev/null 2>&1; then
                    pt_error "${file} missing. File below is necessary in ${mdir}:"
                    cat -n ${mdir}/.filelist && exit 1
                fi
            done
        else
            pt_error "${mdir}/.filelist not found"
            exit 1
        fi
    fi
}

true ${START_TIME:=`date +%s`}
export START_TIME
true ${DEBUG:=no}
