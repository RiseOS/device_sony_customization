# Copyright (C) 2018 The SonyAosp Project
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

# Customization path
LOCAL_PATH := device/sony/customization

# bootctrl
ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.$(TARGET_BOARD_PLATFORM) \
    libgptutils \
    libz
endif

ifeq ($(AB_OTA_UPDATER),true)
# A/B OTA dexopt package
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true
endif

# Qseecom dependencies
ifneq ($(filter-out loire,$(SOMC_PLATFORM)),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp/rootdir/sbin/android.hardware.gatekeeper@1.0-service-qti:recovery/root/sbin/android.hardware.gatekeeper@1.0-service-qti \
    $(LOCAL_PATH)/twrp/rootdir/sbin/android.hardware.keymaster@3.0-service-qti:recovery/root/sbin/android.hardware.keymaster@3.0-service-qti \
    $(LOCAL_PATH)/twrp/rootdir/sbin/qseecomd:recovery/root/sbin/qseecomd \
    $(LOCAL_PATH)/twrp/rootdir/vendor/manifest.xml:recovery/root/$(TARGET_COPY_OUT_VENDOR)/manifest.xml \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/hw/android.hardware.keymaster@3.0-impl-qti.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.keymaster@3.0-impl-qti.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libdiag.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libdiag.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libdrmfs.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libdrmfs.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libdrmtime.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libdrmtime.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libGPreqcancel.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libGPreqcancel.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libGPreqcancel_svc.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libGPreqcancel_svc.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libkeymasterdeviceutils.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymasterdeviceutils.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libqisl.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libqisl.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libQSEEComAPI.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libQSEEComAPI.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/librpmb.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/librpmb.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libssd.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libssd.so \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libtime_genoff.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libtime_genoff.so
endif

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp/rootdir/vendor/lib64/libgptutils.so:recovery/root/$(TARGET_COPY_OUT_VENDOR)/lib64/libgptutils.so
endif
