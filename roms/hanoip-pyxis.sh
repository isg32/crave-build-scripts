# Build Script for hanoip

## Remove local_manifests directory
rm -rf .repo/local_manifests

## Clone the manifest repository
repo init --depth=1 --no-repo-verify -u https://github.com/PixysOS/manifest -b fourteen-v2 --git-lfs -g default,-mips,-darwin,-notdefault

## Clone trees
git clone https://github.com/isg32/android_device_motorola_hanoip -b pyxis device/motorola/hanoip
git clone https://github.com/anoosragh69/android_device_motorola_hanoip-kernel device/motorola/hanoip-kernel
git clone https://github.com/anoosragh69/android_vendor_motorola_hanoip vendor/motorola/hanoip

## Force sync the repository
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

## Install ccache
sudo apt update
sudo apt install ccache -y

## Set up the build environment
source build/envsetup.sh

export BUILD_HOSTNAME=crave
export BUILD_USERNAME=semisapeol

# Lunch for hanoip device
lunch pixys_hanoip-ap1a-userdebug

# Build for hanoip device
m bacon
