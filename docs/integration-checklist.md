# OPWE242 integration checkpoints

This checklist turns the scaffold into explicit work items. Completing a
source checkout is not evidence of a successful device build or boot.

## Source and build host

- Use the exact 43 mm OnePlus kernel/module branch and locked revisions.
- Keep the published A.123 source version separate from the A.165 stock
  reference. Establish the kernel/module KMI rather than mixing them by name.
- Build on Linux with a case-sensitive filesystem, POSIX modes and symlinks.
- Resolve the actual kernel ROOT_DIR and build script from the upstream
  module repository; inspect its existing build-tools before adding more.
- Pin the Clang r487747c toolchain, external/dtc and any selected libufdt
  inputs. Document the hashes and source licenses of additional dependencies.

## Original stock material

- Analyze stock files only from the exact device/build selected for testing.
- Preserve the provenance of full and incremental OTA packages separately.
- Extract partition contents locally while retaining original filesystem
  metadata when possible. A Windows file copy does not preserve every mode,
  ownership field, SELinux xattr or symlink.
- Inventory available files and ELF architecture with the vendor repository's
  `tools/inspect_vendor_tree.py`. Its output is evidence of file availability,
  hashes and ELF header fields, not proof of service or driver compatibility.
- Keep images, proprietary binaries, certificates, credentials and raw logs
  outside all public source repositories.

## Android product configuration

- Integrate the two architecture fragments into a complete product only when
  its runtime, JNI and graphics architecture decisions have been established.
- Verify that ARM64 graphics consumers have compatible drivers. The observed
  stock EGL/Vulkan/mapper sample is ARM32; enabling a secondary ARM ABI alone
  does not make those libraries loadable in ARM64 processes.
- Obtain boot header versions, ramdisk topology, partition sizes, dynamic
  partition metadata and AVB requirements from the selected stock images.
- Implement packaging from those observations; do not treat an upstream
  kernel's SUPER_IMAGE_SIZE as the Watch's stock geometry.
- Establish linker namespaces and dependencies, including any verified legacy
  VNDK requirement, before selecting additional runtime packages.

## OEM and Wear contracts

- Map MCU/sensor hub, time synchronization, display and vibration contracts.
- Identify the actual Health Services and sensor HAL versions and their
  clients. Run checkvintf against the combined device/framework configuration.
- Review init services, users, groups, capabilities and startup ordering.
- Compile and test the combined SELinux policy; do not paper over access
  failures by disabling enforcement.
- Verify OEM framework extensions, JNI and APEX dependencies against the
  target platform. AOSP source alone does not provide Wear OS integration.
- Define functional checks for sensor readings, display, touch, Bluetooth,
  Wi-Fi, MCU suspend/resume, charging and power consumption.

## Hardware test readiness

- Confirm bootloader behavior and a restoration path for the actual model.
- Keep a matched stock set and verify the acceptance of its signing keys.
- Produce a reproducible build and record exact source/toolchain revisions.
- Validate image format and AVB metadata offline before a hardware test.
- Record any remaining incompatibility in the release description. Publish
  only claims supported by a repeatable test on this target.

This document is original Apache-2.0 project documentation. It is a work
checklist and does not authorize executing diagnostics, unlocking or flashing.
