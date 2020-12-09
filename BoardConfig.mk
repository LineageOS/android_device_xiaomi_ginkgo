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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from sm6125-common
-include device/xiaomi/sm6125-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/ginkgo

BUILD_BROKEN_DUP_RULES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := ginkgo,willow

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
ODM_MANIFEST_SKUS += \
    nfc

ODM_MANIFEST_NFC_FILES := $(DEVICE_PATH)/manifest_nfc.xml

# Init
SOONG_CONFIG_NAMESPACES += XIAOMI_TRINKET_INIT
SOONG_CONFIG_XIAOMI_TRINKET_INIT := DEVICE_LIB
SOONG_CONFIG_XIAOMI_TRINKET_INIT_DEVICE_LIB := //$(DEVICE_PATH):libinit_ginkgo

# Kernel
TARGET_KERNEL_CONFIG := vendor/ginkgo-perf_defconfig

# NFC
TARGET_USES_NQ_NFC := true

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4831838208
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Security patch level
VENDOR_SECURITY_PATCH := 2020-11-01

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit the proprietary files
-include vendor/xiaomi/ginkgo/BoardConfigVendor.mk
