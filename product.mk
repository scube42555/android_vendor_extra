# Enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opa.eligible_device=true

ifeq ($(SIGNED_BUILD),true)
# Use own keys
PRODUCT_DEFAULT_DEV_CERTIFICATE := /home/bob/.android-cert/releasekey
# Use := instead of += to remove Lineage's keys
PRODUCT_EXTRA_RECOVERY_KEYS := /home/bob/.android-cert/releasekey
endif

GAPPS_VARIANT := micro
WITH_GAPPS=true
ifeq ($(WITH_GAPPS),true)


# include OpenGAPPS
#GAPPS_PRODUCT_PACKAGES += ActionServices
#GAPPS_PRODUCT_PACKAGES += Gmail
#GAPPS_PRODUCT_PACKAGES += Wallpapers
#GAPPS_PRODUCT_PACKAGES += Search
#GAPPS_PRODUCT_PACKAGES += PixelLauncher
GAPPS_PRODUCT_PACKAGES += CarrierServices
GAPPS_PRODUCT_PACKAGES += ClockGoogle
GAPPS_PRODUCT_PACKAGES += Maps
GAPPS_PRODUCT_PACKAGES += Messenger
GAPPS_PRODUCT_PACKAGES += Photos
GAPPS_PRODUCT_PACKAGES += YouTube
GAPPS_PRODUCT_PACKAGES += Chrome
GAPPS_PRODUCT_PACKAGES += CameraGoogle
GAPPS_PRODUCT_PACKAGES += DialerGoogle
GAPPS_PRODUCT_PACKAGES += KeyboardGoogle

#GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_MMS_OVERRIDES := true
GAPPS_FORCE_DIALER_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true

#GAPPS_BYPASS_PACKAGE_OVERRIDES := Chrome
#GAPPS_BYPASS_PACKAGE_OVERRIDES += PixelLauncher
#GAPPS_BYPASS_PACKAGE_OVERRIDES += Messenger
#GAPPS_BYPASS_PACKAGE_OVERRIDES += DialerGoogle

GAPPS_EXCLUDED_PACKAGES += WebViewGoogle

# mindthegapps
#$(call inherit-product, vendor/gapps/common/common-vendor.mk)

# opengapps
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

endif

# Recovery ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

# Use own updater
PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://scubeOS.barkascruff.com/api/v1/{device}/{type}/{incr}

#include Lawnchair
PRODUCT_PACKAGES += \
    Lawnchair

# Lawnchair permissions
PRODUCT_COPY_FILES += \
    vendor/extra/config/permissions/privapp-permissions-lawnchair.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/extra/config/permissions/lawnchair-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Lawnchair Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/extra/lawnchairoverlay/

#include OPScrenRecorder
PRODUCT_PACKAGES += \
    OPScreenRecorder

# Screenrecorder permissions
PRODUCT_COPY_FILES += \
    vendor/extra/config/permissions/privapp-permissions-screenrecorder.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-screenrecorder.xml

#include Longshot
#PRODUCT_PACKAGES += \
#    Longshot

# Longshot permissions
#PRODUCT_COPY_FILES += \
#    vendor/extra/config/permissions/longshot-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/longshot-hiddenapi-package-whitelist.xml

#PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=http://ota.barkascruff/scubeOS/api/v1/{device}/{type}/{incr}
#PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=http://ota.barkascruff/scubeOS
