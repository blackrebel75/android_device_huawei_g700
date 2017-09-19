# Copyright (C) 2017 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/huawei/g700

-include vendor/huawei/g700/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := mt6589
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6589
# blob hacks
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK -DMTK_MT6589 -DMTK_G_MT6589 -DMTK_HARDWARE
COMMON_GLOBAL_CPPFLAGS += -DDISABLE_HW_ID_MATCH_CHECK -DMTK_MT6589 -DMTK_G_MT6589 -DMTK_HARDWARE
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

#MTK DEFINITIONS
HAVE_XLOG_FEATURE := yes
HAVE_AEE_FEATURE := yes
MTK_ION_SUPPORT := yes
MTK_HWC_SUPPORT := yes
MTK_DP_FRAMEWORK := yes
MTK_HWC_VERSION := 1.2
MTK_ROOT := mediatek
MTK_PLATFORM := MT6589
COMMON_GLOBAL_CFLAGS += -DMTK_VIDEO_HEVC_SUPPORT
COMMON_GLOBAL_CPPFLAGS += -DMTK_VIDEO_HEVC_SUPPORT

BOARD_HAS_MTK_HARDWARE := true
BOARD_NEEDS_OLD_HWC_API := true

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/g700/bluetooth

# power
TARGET_POWERHAL_VARIANT := cm

# boot
TARGET_NO_BOOTLOADER := true

# EGL settings
BOARD_EGL_CFG := device/huawei/g700/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# partition info
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1611661312
BOARD_USERDATAIMAGE_PARTITION_SIZE:= 4830789632
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456

BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/rootdir/twrp.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel
# TARGET_NO_RECOVERY := true
BOARD_HAS_NO_SELECT_BUTTON := true
# RECOVERY_VARIANT=twrp

# MKIMAGE
TARGET_MKIMAGE := device/huawei/g700/mkimage
TARGET_USE_BUILT_BOOTIMAGE := true
BOARD_CUSTOM_BOOTIMG_MK := device/huawei/g700/boot.mk

# Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := mediatek
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# telephony
BOARD_RIL_CLASS := ../../../device/huawei/g700/ril/

TARGET_SPECIFIC_HEADER_PATH := device/huawei/g700/include

# allow more than one lun file
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

#SEPolicy
BOARD_SEPOLICY_DIRS += \
    device/huawei/g700/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    device.te \
    netd.te

# TWRP
BOARD_HAS_LARGE_FILESYSTEM := true

TW_NO_USB_STORAGE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/mt6320-battery/power_supply/battery

TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"