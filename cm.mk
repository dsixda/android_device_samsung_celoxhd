$(call inherit-product, device/samsung/celoxhd/full_celoxhd.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I757M TARGET_DEVICE=SGH-I757M BUILD_FINGERPRINT="samsung/SGH-I757M/SGH-I757M:4.0.4/IMM76D/UCLE2:user/release-keys" PRIVATE_BUILD_DESC="SGH-I757M-user 4.0.4 IMM76D UCLE2 release-keys"

TARGET_BOOTANIMATION_NAME := vertical-720x1280

PRODUCT_NAME := cm_celoxhd
PRODUCT_DEVICE := celoxhd

