#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=ginkgo
export DEVICE_COMMON=sm6125-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="$MY_DIR"/../../..
DEVICE_BLOB_ROOT="$ANDROID_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary

# Remove vtcamera for ginkgo
gawk -i inplace '{ p = 1 } /<CameraModuleConfig>/{ t = $0; while (getline > 0) { t = t ORS $0; if (/ginkgo_vtcamera/) p = 0; if (/<\/CameraModuleConfig>/) break } $0 = t } p' "${DEVICE_BLOB_ROOT}/vendor/etc/camera/camera_config.xml"
sed -i "s/ginkgo_s5kgm1_sunny_i/ginkgo_s5kgm1_ofilm_ii/g" "${DEVICE_BLOB_ROOT}/vendor/etc/camera/ginkgo_s5kgm1_sunny_i_chromatix.xml"
sed -i "s/ginkgo_s5kgm1_ofilm_ii_common/ginkgo_s5kgm1_sunny_i_common/g" "${DEVICE_BLOB_ROOT}/vendor/etc/camera/ginkgo_s5kgm1_sunny_i_chromatix.xml"
sed -i "s/ginkgo_s5kgm1_ofilm_ii_postproc/ginkgo_s5kgm1_sunny_i_postproc/g" "${DEVICE_BLOB_ROOT}/vendor/etc/camera/ginkgo_s5kgm1_sunny_i_chromatix.xml"
