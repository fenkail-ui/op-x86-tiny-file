# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2006-2011 OpenWrt.org

include $(TOPDIR)/rules.mk

ARCH:=i386
BOARD:=x86
BOARDNAME:=x86
FEATURES:=squashfs vdi vmdk fpu boot-part rootfs-part
SUBTARGETS:=64 generic legacy geode 

KERNEL_PATCHVER:=5.4
KERNEL_TESTING_PATCHVER:=5.10

KERNELNAME:=bzImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += partx-utils mkf2fs e2fsprogs kmod-button-hotplug wpad kmod-usb-hid kmod-mmc-spi kmod-sdhci kmod-fs-f2fs cfdisk \
kmod-e1000e kmod-e1000 kmod-igb kmod-ixgbe kmod-amd-xgbe kmod-r8168 kmod-vmxnet3 kmod-8139cp kmod-8139too \
htop lm-sensors autocore-x86 automount autosamba luci-app-adbyby-plus luci-proto-bonding luci-app-unblockmusic ddns-scripts_aliyun ddns-scripts_dnspod ca-bundle luci-app-uugamebooster luci-app-qbittorrent \

$(eval $(call BuildTarget))

$(eval $(call $(if $(CONFIG_ISO_IMAGES),SetupHostCommand,Ignore),mkisofs, \
	Please install mkisofs. , \
	mkisofs -v 2>&1 , \
	genisoimage -v 2>&1 | grep genisoimage, \
	xorrisofs -v 2>&1 | grep xorriso \
))
