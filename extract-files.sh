#!/bin/bash
#
# Copyright (C) 2018-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export DEVICE=ginkgo
export VENDOR=xiaomi
export DEVICE_COMMON=sm6125-common

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh "$@"

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..
DEVICE_BLOB_ROOT="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary

# Remove vtcamera for ginkgo
gawk -i inplace '{ p = 1 } /<CameraModuleConfig>/{ t = $0; while (getline > 0) { t = t ORS $0; if (/ginkgo_vtcamera/) p = 0; if (/<\/CameraModuleConfig>/) break } $0 = t } p' "${DEVICE_BLOB_ROOT}/vendor/etc/camera/camera_config.xml"
sed -i "s/ginkgo_s5kgm1_sunny_i/ginkgo_s5kgm1_ofilm_ii/g" "${DEVICE_BLOB_ROOT}/vendor/etc/camera/ginkgo_s5kgm1_sunny_i_chromatix.xml"
sed -i "s/ginkgo_s5kgm1_ofilm_ii_common/ginkgo_s5kgm1_sunny_i_common/g" "${DEVICE_BLOB_ROOT}/vendor/etc/camera/ginkgo_s5kgm1_sunny_i_chromatix.xml"
sed -i "s/ginkgo_s5kgm1_ofilm_ii_postproc/ginkgo_s5kgm1_sunny_i_postproc/g" "${DEVICE_BLOB_ROOT}/vendor/etc/camera/ginkgo_s5kgm1_sunny_i_chromatix.xml"
