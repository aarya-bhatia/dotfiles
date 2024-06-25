# sudo pacman -S libimobiledevice ifuse usbmuxd
# systemctl status usbmuxd.service # ensure servie running
# idevicepair list
# mkdir -p /mnt/iOS
# sudo ifuse -o allow_other /mnt/iOS

systemctl restart usbmuxd.service
idevicepair pair
ifuse .iPhone
ifuse --documents org.videolan.vlc-ios .iPhone_VLC
