# SPDX-License-Identifier: Apache-2.0
# Copyright 2026 OpWatch-Os contributors
# Experimental architecture fragment; not a complete Android BoardConfig.
# The AOSP Android 17 arm64 baseline supports a secondary ARM ABI.
# Graphics consumers, JNI and vendor contracts still require verification.
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
