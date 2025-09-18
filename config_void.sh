
sudo xbps-install -u xbps
sudo xbps-install -Syu


sudo sed -i "s/# %wheel ALL=(ALL:ALL) ALL/wheel ALL=(ALL:ALL) ALL/g" /etc/sudoers


sudo xbps-install void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -Syu


sudo xbps-install intel-ucode linux-firmware-amd
sudo xbps-reconfigure -f linux


sudo sed -i "s/#en_US.UTF-8/en_US.UTF-8/g" /etc/default/libc-locales
sudo sed -i "s/#ja_JP.UTF-8/ja_JP.UTF-8/g" /etc/default/libc-locales
sudo sed -i "s/#ru_RU.UTF-8/ru_RU.UTF-8/g" /etc/default/libc-locales
sudo sed -i "s/#zh_CN.UTF-8/zh_CN.UTF-8/g" /etc/default/libc-locales
sudo xbps-reconfigure -f glibc-locales


sudo xbps-install dbus
sudo ln -s /etc/sv/dbus /var/service/


sudo xbps-install elogind
#sudo ln -s /etc/sv/elogind /var/service/


sudo xbps-install NetworkManager
sudo unlink /var/service/dhcpcd
sudo unlink /var/service/wpa_supplicant
#sudo unlink /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/

sudo xbps-install cronie
if [ ! -d /etc/cron.weekly ]; then
    sudo mkdir /etc/cron.weekly
fi
sudo bash -c 'echo "fstrim /" >> /etc/cron.weekly/fstrim'
sudo chmod u+x /etc/cron.weekly/fstrim


sudo xbps-install linux-firmware mesa-dri mesa-dri-32bit
#sudo xbps-install nvidia nvidia-libs-32bit
#sudo sed -i "s/blacklist nouveau/#blacklist nouveau/g" /etc/modprobe.d/nouveau_blacklist.conf
#sudo sed -i "s/blacklist nouveau/#blacklist nouveau/g" /usr/lib/modprobe.d/nvidia.conf
#sudo sed -i "s/blacklist nouveau/#blacklist nouveau/g" /usr/lib/modprobe.d/nvidia-dkms.conf


sudo xbps-install noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji nerd-fonts
sudo xbps-install xdg-desktop-portal xdg-desktop-portal-gtk


sudo xbps-install alsa-utils apulse alsa-plugins-pulseaudio pipewire wireplumber libsa-bluetooth libjack-pipewire

sudo ln -s /etc/sv/alsa /var/service/

sudo mkdir -p /etc/pipewire/pipwire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/


sudo xbps-install bluez
sudo ln -s /etc/sv/bluetoothd /var/service/
sudo xbps-install libspa-bluetooth


#sudo xbps-install gnome gnome-core gnome-apps
#sudo ln -s /etc/sv/gdm /var/service/
