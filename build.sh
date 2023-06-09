#!/bin/bash

# Change to the Source Directory
cd $SYNC_PATH

# Set-up ccache
if [ -z "$CCACHE_SIZE" ]; then
    ccache -M 10G
else
    ccache -M ${CCACHE_SIZE}
fi

# Run the Extra Command
#$EXTRA_CMD

#cp -af hardware/qcom-caf/common/os_pickup.bp hardware/qcom-caf/sdm660/Android.bp && cp -af hardware/qcom-caf/common/os_pickup.mk hardware/qcom-caf/sdm660/Android.mk
echo $LD_LIBRARY_PATH
echo "end 1 zero"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/library
echo "end 2 zero"
find / -name libncursed.so.5


# Prepare the Build Environment
source build/envsetup.sh

# lunch the target
lunch ${LUNCH_COMBO} || { echo "ERROR: Failed to lunch the target!" && exit 1; }

# Build the Code

mka bacon
#if [ -z "$J_VAL" ]; then
#    mka -j$(nproc --all) $TARGET || { echo "ERROR: Build Failed!" && exit 1; }
#elif [ "$J_VAL"="0" ]; then
#    mka $TARGET || { echo "ERROR: Build Failed!" && exit 1; }
#else
#    mka -j${J_VAL} $TARGET || { echo "ERROR: Build Failed!" && exit 1; }
#fi

# Exit
exit 0
