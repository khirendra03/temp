#!/bin/bash

sudo apt-get install libncurses5-dev libncursesw5-dev
sudo dnf install ncurses

# Make the Directory if it doesn't exist
mkdir -p $SYNC_PATH

# Change to the Source Directory
cd $SYNC_PATH

# Init Repo
repo init --depth=1 -u $MANIFEST -b $MANIFEST_BRANCH

# Sync the Sources
repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle

# Clone Trees
git clone --depth=1 $DT_LINK $DT_PATH || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }
git clone --depth=1 $CM_LINK $CM_PATH || { echo "ERROR: Failed to Clone the Common Trees!" && exit 1; }
git clone --depth=1 $VT_LINK $VT_PATH
git clone --depth=1 $KT_LINK $KT_PATH

# clang 14.0.1
git clone --depth=1 https://gitlab.com/arrowos-project/android_prebuilts_clang_host_linux-x86_clang-r437112b -b master prebuilts/clang/host/linux-x86/clang-r437112b
git clone --depth=1 https://github.com/nerdprojectorg/SDClang.git -b 14 prebuilts/clang/host/linux-x86/clang-sdllvm
git clone --depth=1 https://gitlab.com/varunhardgamer/trb_clang.git -b 14 prebuilts/clang/host/linux-x86/trb_clang

#rm -rf hardware/qcom-caf/msm8998/display
#git clone https://github.com/VoltageOS-staging/hardware_qcom_display -b 13-msm8998 hardware/qcom-caf/msm8998/display
#git clone https://github.com/Asus-Max-Pro-M2/hardware_qcom-caf_sdm660_display -b thirteen hardware/qcom-caf/sdm660/display
#git clone https://github.com/khirendra03/android_hardware_qcom-caf_sdm660_display.git -b tm hardware/qcom-caf/sdm660/display
#git clone https://github.com/SDM660-lavender/android_hardware_qcom_display.git -b 13-caf_4.19 hardware/qcom-caf/sdm660/display

#rm -rf hardware/qcom-caf/msm8998/audio
#git clone https://github.com/Asus-Max-Pro-M2/hardware_qcom-caf_sdm660_media -b thirteen hardware/qcom-caf/sdm660/audio
#git clone https://github.com/VoltageOS-staging/hardware_qcom_audio -b 13-msm8998 hardware/qcom-caf/msm8998/audio
#git clone https://github.com/nerdprojectorg/android_hardware_qcom-caf_sdm660_audio.git -b tm hardware/qcom-caf/sdm660/audio
#git clone https://github.com/SDM660-lavender/android_hardware_qcom_audio.git -b 13-caf-sdm660 hardware/qcom-caf/sdm660/audio

#rm -rf hardware/qcom-caf/msm8998/media
#git clone https://github.com/Asus-Max-Pro-M2/hardware_qcom-caf_sdm660_media -b thirteen hardware/qcom-caf/sdm660/media
#git clone https://github.com/SDM660-lavender/android_hardware_qcom_media.git -b 13-caf-sdm660 hardware/qcom-caf/sdm660/media
#git clone https://github.com/nerdprojectorg/android_hardware_qcom-caf_sdm660_media.git -b tm hardware/qcom-caf/sdm660/media

#rm -rf vendor/qcom/opensource/commonsys-intf/display
#git clone https://github.com/NerdZ3ns/android_vendor_qcom_opensource_display-commonsys-intf.git -b arrow-13.0 vendor/qcom/opensource/commonsys-intf/display
#git clone https://github.com/LineageOS/android_vendor_qcom_opensource_display-commonsys-intf.git -b lineage-20.0 vendor/qcom/opensource/commonsys-intf/display

#rm -rf hardware/google/pixel/kernel_headers/Android.bp
sudo apt-get install libncurses5-dev libncursesw5-
sudo dnf install ncurses

# Exit
exit 0
