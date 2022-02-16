#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6125-common
include device/xiaomi/sm6125-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/ginkgo

# A/B
AB_OTA_UPDATER := false

# Assert
TARGET_OTA_ASSERT_DEVICE := ginkgo,willow

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ginkgo

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_CONFIG += vendor/ginkgo.config
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/4744000.sdhci

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4831838208
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x04000000

# NFC
ODM_MANIFEST_WILLOW_FILES := $(DEVICE_PATH)//manifest_willow.xml
ODM_MANIFEST_SKUS += willow

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Security patch level - V12.5.12.0.RCOEUXM
BOOT_SECURITY_PATCH := 2022-10-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Inherit from the proprietary version
include vendor/xiaomi/ginkgo/BoardConfigVendor.mk
