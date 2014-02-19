# Release name
PRODUCT_RELEASE_NAME := valentewx

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/valentewx/device_valentewx.mk)

# Device naming
PRODUCT_DEVICE := valentewx
PRODUCT_NAME := cm_valentewx
PRODUCT_BRAND := KDDI
PRODUCT_MODEL := ISW13HT
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_valentewx BUILD_FINGERPRINT=htc_europe/valentewx/valentewx:4.1.1/JRO03C/128506.8:user/release-keys PRIVATE_BUILD_DESC="3.16.401.8 CL128506 release-keys" BUILD_NUMBER=128506
