define Device/generic
  DEVICE_TITLE := Generic x86
  DEVICE_PACKAGES += kmod-8139too \
	kmod-r8168 \
	kmod-fs-vfat
  GRUB2_VARIANT := generic
endef
TARGET_DEVICES += generic
