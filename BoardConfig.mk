# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm8660
-include device/samsung/msm8660-common/BoardConfigCommon.mk
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8660
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# inherit from the proprietary version
-include vendor/samsung/celoxhd/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := celoxhd

# Assert
TARGET_OTA_ASSERT_DEVICE := SGH-I757M,SGH-I757,celoxhd

# Kernel
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom msm_watchdog.appsbark=0 msm_watchdog.enable=1 loglevel=4
BOARD_KERNEL_BASE           := 0x48000000
BOARD_KERNEL_PAGESIZE       := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x49500000
TARGET_KERNEL_CONFIG        := cyanogenmod_celoxhd_defconfig
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660-common
#TARGET_PREBUILT_KERNEL      := device/samsung/celoxhd/kernel

# Override bootable/recovery/minui/graphics.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/celoxhd/recovery/graphics.c

# From /proc/partitions (each were multiplied by 1024)
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 941621248
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2149580800

# From df
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p28
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Turn off the 'Android' text-mode splash screen with flashing cursor :P
TARGET_NO_INITLOGO := true

# MTP
BOARD_MTP_DEVICE := "/dev/mtp_usb"

# NFC
# Need to set it under full_celoxhd.mk
#BOARD_HAVE_NFC := true

# FIXME: Overlay has an issue on Quincy when playing video in landscape mode
COMMON_GLOBAL_CFLAGS += -DQCOM_ROTATOR_KERNEL_FORMATS

# FIXME: needs to be disabled for camera preview to work correctly
# TARGET_QCOM_HDMI_OUT := false

# Audio
TARGET_USES_QCOM_LPA := true
COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA
BOARD_HAS_SAMSUNG_VOLUME_BUG := true

# Workaround for glitches while cropping bypass layers
TARGET_NO_BYPASS_CROPPING := true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

# Prevent modelid_cfg.sh error when flashing
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/samsung/celoxhd/releasetools/ota_from_target_files

