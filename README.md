## Build Instructions for Celox HD


### Follow the usual instructions to download sources for CM9, e.g.
```
1) mkdir ~/android/system
2) cd ~/android/system
3) curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
4) chmod a+x ~/bin/repo
5) repo init -u git://github.com/CyanogenMod/android.git -b ics
```
(You'll need to install some binaries, but those are the basic instructions)

Remain in ~/android/system for the rest of the commands.

### Include the following in .repo/local_manifest.xml to allow these additional repositories to be synced:
```
<project name="CyanogenMod/android_kernel_samsung_msm8660-common" path="kernel/samsung/msm8660-common" remote="github" revision="ics" />
<project name="CyanogenMod/android_device_samsung_msm8660-common" path="device/samsung/msm8660-common" remote="github" revision="ics" />
<project name="dsixda/android_device_samsung_celoxhd" path="device/samsung/celoxhd" revision="master" />
<project name="dsixda/android_kernel_samsung_celoxhd" path="kernel/samsung/msm8660-common/arch/arm/configs" revision="master" />
<project name="dsixda/android_vendor_samsung_celoxhd" path="vendor/samsung/celoxhd" revision="master" />
```

### Download or update all repositories:
```
repo sync -j4
```

### Get all the prebuilts, like ROM Manager:
```
vendor/cm/get-prebuilts
```

### NOTE: If you are going to build ClockworkMod, to avoid the Nandroid backup process hanging on long file names:
```
1) Open bootable/recovery/nandroid.c 
2) In the 'yaffs_callback' procedure, add the command "return;" to the first line
```

### Ready to build!
```
. build/envsetup.sh
brunch cm_celoxhd-eng
```

### OPTIONAL: If you want to build ClockworkMod:
```
. build/tools/device/makerecoveries.sh cm_celoxhd-eng 
```

