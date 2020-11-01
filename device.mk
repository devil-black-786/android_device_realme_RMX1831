# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *
# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_vendor \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0_system

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    android.hardware.soundtrigger@2.3-impl

# Audio policy configuration
USE_XML_AUDIO_POLICY_CONF := 1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.secure_lock_screen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.secure_lock_screen.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \

# Misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/misc/factory.ini:$(TARGET_COPY_OUT_SYSTEM)/etc/factory.ini \
    $(LOCAL_PATH)/misc/custom.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/custom.conf

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder \

# APNs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.mt6771.rc \
    fstab.mt6771 \
    init.safailnet.rc \
    init.recovery.mt6771.rc \
    init.recovery.usb.rc \
    set_zram.sh

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml

# Keyboard layout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/ACCDET.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ACCDET.kl \
    $(LOCAL_PATH)/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl

# Input/DT2W
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    gralloc.default \
    libhwc2on1adapter \
    libhwc2onfbadapter

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.drm@1.1-service.widevine

# Tethering
PRODUCT_PACKAGES += \
    TetheringConfigOverlay

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service \
    android.hardware.health@2.0-service.override

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service \
    android.hardware.vibrator@1.0-impl

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \

# Binder
PRODUCT_PACKAGES += \
    libhwbinder \
    libhwbinder.vendor \
    libhidltransport

#WiFi
PRODUCT_PACKAGES += \
    hostapd \
    libwpa_client \
    libwifi-hal \
    wpa_supplicant \
    wpa_supplicant.conf

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Doze
PRODUCT_PACKAGES += \
    RealmeParts

# KPOC
PRODUCT_PACKAGES += \
    libsuspend

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.RMX1831

# Camera
PRODUCT_PACKAGES += \
    Snap

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.RMX1831 \
    vendor.oppo.hardware.biometrics.fingerprint@2.1

# Memory optimization
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.sys.fw.bservice_enable=true \
    ro.sys.fw.bservice_limit=5 \
    ro.sys.fw.bservice_age=5000 \
    ro.am.reschedule_service=true \
    ro.sys.fw.bg_apps_limit=24 

# Graphics
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    debug.sf.enable_gl_backpressure=1 \
    ro.hardware.egl=mali 

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   media.stagefright.thumbnail.prefer_hw_codecs=true

#BlurGang 
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.disable_backpressure=1

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 28
PRODUCT_EXTRA_VNDK_VERSIONS := 28

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 

PRODUCT_PACKAGES += \
    RcsService

$(call inherit-product, vendor/realme/RMX1831/RMX1831-vendor.mk)
