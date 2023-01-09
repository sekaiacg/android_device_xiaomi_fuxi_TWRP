#
# Copyright (C) 2023 The TwrpBuilder Open-Source Project
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
#

DEVICE_PATH := device/xiaomi/fuxi

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Release name
PRODUCT_RELEASE_NAME := socrates

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := fuxi
PRODUCT_NAME := twrp_socrates
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi K60 Pro
PRODUCT_MANUFACTURER := Xiaomi

# Assert
TARGET_OTA_ASSERT_DEVICE := $(PRODUCT_RELEASE_NAME)

# Kernel modules
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko goodix_core.ko"

# Haptic
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true

# Touch
TW_XIAOMI_TOUCH_PERMISSION_FIX := true

# Theme
TW_STATUS_ICONS_ALIGN := center
TW_Y_OFFSET := 99
TW_H_OFFSET := -99
