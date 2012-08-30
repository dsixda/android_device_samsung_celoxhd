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

# inherit from the proprietary version
-include vendor/samsung/celoxhd/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := celoxhd

# Assert
TARGET_OTA_ASSERT_DEVICE := SGH-I757M,SGH-I757,celoxhd,SGHI757M,SGHI757

# Kernel
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom msm_watchdog.appsbark=0 msm_watchdog.enable=1 loglevel=4
BOARD_KERNEL_BASE           := 0x48000000
BOARD_KERNEL_PAGESIZE       := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x49500000
TARGET_KERNEL_CONFIG        := cyanogenmod_celoxhd_defconfig
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660-common

# Override bootable/recovery/minui/graphics.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/celoxhd/recovery/graphics.c

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_NO_SELECT_BUTTON := true

# Suppress the WIPE command since it can brick our EMMC
BOARD_SUPPRESS_EMMC_WIPE := true

# Workaround for glitches while cropping bypass layers
# TODO (orphaned) TARGET_NO_BYPASS_CROPPING := true

# MTP
# TODO (orphaned) BOARD_MTP_DEVICE := "/dev/mtp_usb"

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

# Preload the boot animation to avoid jerkiness
TARGET_BOOTANIMATION_PRELOAD := true

# VoIP
#COMMON_GLOBAL_CFLAGS += -DQCOM_VOIP_ENABLED

