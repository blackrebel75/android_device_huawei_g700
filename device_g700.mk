# Copyright (C) 2017 The Android Open Source Project
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

$(call inherit-product-if-exists, vendor/huawei/g700/g700-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Hack for use prebuilt webviewchromium
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,vendor/huawei/g700/proprietary/framework,system/framework)
PRODUCT_COPY_FILES +=  \
        vendor/huawei/g700/proprietary/lib/libchromium_net.so:system/lib/libchromium_net.so \
        vendor/huawei/g700/proprietary/lib/libwebviewchromium.so:system/lib/libwebviewchromium.so \
        vendor/huawei/g700/proprietary/lib/libwebviewchromium_plat_support.so:system/lib/libwebviewchromium_plat_support.so
endif

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/fstab.mt6589:root/fstab.mt6589 \
	$(LOCAL_PATH)/rootdir/init.mt6589.rc:root/init.mt6589.rc \
	$(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/rootdir/ueventd.mt6589.rc:root/ueventd.mt6589.rc \
	$(LOCAL_PATH)/rootdir/init.protect.rc:root/init.protect.rc \
	$(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \
	$(LOCAL_PATH)/rootdir/init.mt6589.usb.rc:/root/init.mt6589.usb.rc \
	$(LOCAL_PATH)/rootdir/sbin/ksh:root/sbin/ksh \
	$(LOCAL_PATH)/rootdir/sbin/bb:root/sbin/bb

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml
	

# build.prop	
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        ro.adb.secure=0 \
        ro.mount.fs=EXT4 \
        ro.secure=0 \
        ro.allow.mock.location=1
        
PRODUCT_PROPERTY_OVERRIDES := \
	fmradio.driver.chip=3 \
	gps.solution.combo.chip=1 \
	mediatek.wlan.chip=MT6628 \
	mediatek.wlan.ctia=0 \
	mediatek.wlan.module.postfix=_mt6628 \
	persist.mtk.wcn.combo.chipid=0x6628 \
	persist.radio.fd.counter=15 \
	persist.radio.fd.off.counter=5 \
	persist.radio.fd.off.r8.counter=5 \
	persist.radio.fd.r8.counter=15 \
	persist.radio.multisim.config=dsds \
	persist.sys.usb.config=adb \
	ril.current.share_modem=2 \
	ril.external.md=0 \
	ril.first.md=1 \
	ril.flightmode.poweroffMD=1 \
	ril.radiooff.poweroffMD=0 \
	ril.specific.sm_cause=0 \
	ril.telephony.mode=1 \
	rild.libpath=/system/lib/mtk-ril.so \
	ro.gemini.smart_3g_switch=1 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.gemini_support=true \
	ro.mediatek.platform=MT6589 \
	ro.mediatek.version.branch=KK1.MP5 \
	ro.mediatek.version.release=ALPS.KK1.MP5.V1.5 \
	ro.mediatek.version.sdk=2 \
	ro.mediatek.wlan.p2p=1 \
	ro.mediatek.wlan.wsc=1 \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=320 \
	ro.telephony.ril_class=MediaTekRIL \
	wifi.direct.interface=p2p0 \
	wifi.interface=wlan0 \
	wifi.tethering.interface=ap0

PRODUCT_TAGS += dalvik.gc.type-precise

# Ril
PRODUCT_PACKAGES += \
	gsm0710muxd

# Wi-Fi
PRODUCT_PACKAGES += \
	lib_driver_cmd_mtk

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Audio
PRODUCT_PACKAGES += \
	audio.r_submix.default \
	audio.a2dp.default \
        audio.usb.default \
	libblisrc \
        libdashplayer \
        libxlog
        
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# PowerVR SGX544 GPU-Related
PRODUCT_PACKAGES += \
	libcorkscrew \
        gralloc_extra
        
PRODUCT_COPY_FILES += \
	vendor/huawei/g700/proprietary/lib/libdpframework.so:obj/lib/libdpframework.so \
	vendor/huawei/g700/proprietary/lib/libdpframework_os.so:obj/lib/libdpframework_os.so \
	vendor/huawei/g700/proprietary/lib/libdpframework_plat.so:obj/lib/libdpframework_plat.so
		       	       	       
# Build Torch
PRODUCT_PACKAGES += \
	Torch

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

