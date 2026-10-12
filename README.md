# OnePlus Watch 3 43 mm: device scaffold

This repository prepares an experimental Android 17 / Wear OS 7 target for
**OPWE242**, hardware XK935, project 24968. It contains original documentation
and two architecture fragments. It is not a complete Android product and no
build, boot, hardware compatibility or installation has been verified.

`BoardConfig.arch.fragment.mk` proposes ARM64 primary userspace with ARM32
secondary support. `product-runtime.fragment.mk` selects the AOSP multilib
runtime baseline. Include them only after assembling and verifying the rest
of the device configuration; they are deliberately not named BoardConfig.mk
or a lunch product. No partition sizes, AVB keys, boot image parameters,
sepolicy, init configuration or proprietary files are invented here.

The stock A.165 observations describe an ARM64 kernel with CONFIG_COMPAT and
4 KiB pages, while the exposed application ABI and the acquired graphics
libraries are ARM32. An ARM64 graphics process cannot load ELF32 driver
libraries. Multilib alone therefore does not establish functioning graphics
or compatibility with Wear OS 7 components.

The official OnePlus 43 mm source branch is
`sw5100_wear_os_5.0_oneplus_watch_3_43mm`: kernel commit
`824c7022b19eabb6c0831924da134725e6068e40` and modules/device tree commit
`024d4ff6705d3d00256a3af32b25cc22ccde0782`. These published A.123 sources
contain kernel 5.15.167, older than the observed A.165 kernel 5.15.185.
They do not establish module KMI or boot compatibility with A.165.

The public AOSP baseline is `android-17.0.0_r1`, manifest commit
`5bc9a7ce1cd78dd53613bbfd0ebf506e1e4adb0f`. AOSP is only part of the system:
Wear integration, OEM MCU/sensor hub contracts, graphics, init, SELinux,
VINTF, linker namespaces and image packaging remain to be developed and
verified. Public source metadata is in `hardware.json`.

Use a Linux build host with a case-sensitive filesystem, POSIX permissions
and symbolic links. The upstream kernel contains filenames that differ only
by case. Toolchain, build layout and external dependencies also need to be
resolved before claiming a working build.

This repository includes no device serials, credentials, OTA images, keys,
raw device logs or proprietary binaries. The separate vendor repository
contains a public requirements descriptor only. Satisfying a path list does
not prove that a blob can be reused or distributed.

Original scaffold code and documentation are licensed under Apache-2.0.
Existing upstream source retains its own license and notices.
