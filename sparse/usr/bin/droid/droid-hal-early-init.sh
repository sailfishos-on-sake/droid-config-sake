#!/bin/sh

# This should prevent `echo 1 > /dev/ipa` to crash the kernel
echo -n "/vendor/firmware" > /sys/module/firmware_class/parameters/path

# Enable WLAN cold boot calibration
echo 1 > /sys/devices/platform/soc/b0000000.qcom,cnss-qca6490/fs_ready

# Allows qseecomd to start
ln -s /dev/bsg/ufs-bsg0 /dev/ufs-bsg

# Allows libui_compat_layer to work
mount -o bind /dev/null /vendor/lib64/hw/gralloc.default.so

### Below commands are not technically related to droid-hal-init starting
### they are just here for convenience.

# D2TW
echo 1 > /proc/driver/dclick

# Power vibra
/sbin/modprobe aw8697
echo 1 > /sys/class/leds/vibrator/activate_mode

