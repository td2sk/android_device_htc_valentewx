#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common S4 configs
$(call inherit-product, device/htc/s4-common/s4.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/valentewx/overlay

# Boot ramdisk setup
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    remount.qcom

PRODUCT_COPY_FILES += device/htc/valentewx/rootdir/etc/init.qcom.rc:root/init.qcom.rc


# HTC BT audio config
PRODUCT_COPY_FILES += device/htc/valentewx/configs/AudioBTID.csv:system/etc/AudioBTID.csv

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/valentewx/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/valentewx/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/valentewx/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/valentewx/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/valentewx/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/valentewx/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/valentewx/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    device/htc/valentewx/dsp/snd_soc_msm/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

# Media config
PRODUCT_COPY_FILES += \
    device/htc/valentewx/configs/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/valentewx/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/valentewx/keylayout/cy8c-touchkey.kl:system/usr/keylayout/cy8c-touchkey.kl \
    device/htc/valentewx/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/valentewx/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/htc/valentewx/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    device/htc/valentewx/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/valentewx/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/valentewx/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/valentewx/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc

# Recovery
PRODUCT_COPY_FILES += \
    device/htc/valentewx/rootdir/etc/fstab.qcom:recovery/root/fstab.qcom \
    device/htc/valentewx/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/valentewx/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/valentewx/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/valentewx/recovery/sbin/power_test:recovery/root/sbin/power_test

# Torch
PRODUCT_PACKAGES += \
    Torch

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += ja_JP hdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/valentewx/valentewx-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := valentewx
PRODUCT_NAME := valentewx
PRODUCT_BRAND := KDDI
PRODUCT_MODEL := ISW13HT
PRODUCT_MANUFACTURER := HTC
