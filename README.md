# My config

## preparation for debian on android

```sh
sudo apt update
sudo apt upgrade
sudo apt install git zsh curl autocutsel fonts-droid-fallback fonts-noto-cjk scim-pinyin fonts-arphic-ukai libasound2 neovim gcc
sudo apt remove fonts-arphic-ukai fonts-arphic-uming
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -s https://packagecloud.io/install/repositories/headmelted/codebuilds/script.deb.sh | sudo bash
# sudo apt update
# sudo apt install  code-oss
# sudo cp /usr/lib/aarch64-linux-gnu/libxcb.so.1 /usr/lib/aarch64-linux-gnu/libxcb.so.1.bak
# sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/aarch64-linux-gnu/libxcb.so.1
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | zsh
npm install -g --registry=https://registry.npm.taobao.org yarn
npm config set registry=https://registry.npm.taobao.org
yarn config set registry https://registry.npm.taobao.org
```

## init.vim

~/.config/nvim/init.vim

OR

~/.vimrc

## coc-settings

~/.config/nvim/coc-settings.json

## kodi.sh

```sh
#!/bin/bash

# Fix kodi BT speaker issue

while read a ; do echo ${a//audiodevice*audiodevice/audiodevice>ALSA:bluealsa<\/audiodevice} ; done < /home/pi/.kodi/userdata/guisettings.xml > /tmp/guisettings.xml.t ; mv /tmp/guisettings.xml{.t,}

mv /home/pi/.kodi/userdata/guisettings.xml /home/pi/.kodi/userdata/guisettings.xml.old

cp /tmp/guisettings.xml /home/pi/.kodi/userdata/guisettings.xml

if ! grep -q "defaults.bluealsa" /home/pi/.asoundrc

then

rm -rf /home/pi/.asoundrc
printf '\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.interface "hci0"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.device "7C:49:EB:DC:14:BE"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.profile "a2dp"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.delay 10000\n' >> /home/pi/.asoundrc

fi

kodi
```

Then

```sh
chmod a+x kodi.sh
sudo mv kodi.sh /usr/local/bin/
```