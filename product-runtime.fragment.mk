# SPDX-License-Identifier: Apache-2.0
# Copyright 2026 OpWatch-Os contributors
# Experimental product runtime fragment; not a complete Android product.
# Include before the rest of the product configuration and verify no later
# settings force a 64-bit-only runtime.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# This selects an AOSP multilib baseline. It does not convert ARM64 graphics
# consumers to ARM32 or validate OEM/Wear framework dependencies.
# Add legacy VNDK only after establishing actual vendor requirements.
