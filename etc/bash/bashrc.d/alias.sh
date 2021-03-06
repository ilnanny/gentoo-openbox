#!/bin/bash
#================================================
#================================================
#   O.S.      : Gnu Linux                       =
#   Author    : Cristian Pozzessere   = ilnanny =
#   D.A.Page  : http://ilnanny.deviantart.com   =
#   Github    : https://github.com/ilnanny      =
#================================================
#================================================

# ___      Alias


alias 300dpi="for i in *; do inkscape $i -d=300 -C --export-png=`echo $i | sed -e s/svg$/png/`; done"
alias 7zip='7za a -t7z -mx=9 -mfb=256 -md=256m -ms=on'
alias bashome="sudo geany ~/.bashrc"
alias adb="sudo adb"
alias blkid='sudo blkid -c /dev/null -o list'
alias cat='cat -n'
alias chgrp='chgrp --preserve-root'
alias chown='chown --preserve-root'
alias cp="cp -v"
alias df='df -h'
alias egrep='egrep --color=auto'
alias emoji='cat /home/ilnanny/bin/ascii-emoji'
alias eps2svg='for i in *; do inkscape $i --export-plain-svg=`echo $i | sed -e s/eps$/svg/`; done'
alias fc='sudo fc-cache -fv'
alias fgrep='fgrep --color=auto'
alias fixpng="find . -type f -name "*.png" -exec convert {} -strip {} \;"
alias free="free -mt"
alias grep="grep -i --color=auto"
alias gruppi="cut -d: -f1 /etc/group"
alias gy='sudo geany'
alias htop="xterm -e htop"
alias hw="hwinfo --short"
alias info='info --vi-keys --init-file=${XDG_CONFIG_HOME}/infokey'
alias inxi='sudo inxi -xrmFA'
alias kc='killall conky'
alias l="ls -la --dereference-command-line-symlink-to-dir"
alias ll="ls --dereference-command-line-symlink-to-dir -lh"
alias ll='ls -la'
alias ln="ln -v"
alias lp='sudo leafpad'
alias ls="ls --group-directories-first --dereference-command-line-symlink-to-dir --color=auto"
alias lsx='sudo lshw -X'
alias lsbk='lsblk -o +fstype,label,uuid,partuuid'
alias meteo='curl wttr.in/Taranto'
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
alias mp='sudo mousepad'
alias mv="mv -v"
alias myscript='geany /home/ilnanny/bin/zz-ilnanny'
alias nn='sudo nano'
alias pgrep="pgrep -l"
alias ping='ping -c www.google.com'
alias pipinstall='pip install --user'
alias ps="ps auxf"
alias reboot='sudo reboot'
alias riavvia='sudo reboot'
alias rm="rm -v"
alias spegni='sudo shutdown -r now'
alias svg2png='for i in *; do inkscape $i --export-png=`echo $i | sed -e 's/svg$/png/'`; done'
alias upgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias utenti="cut -d: -f1 /etc/passwd"
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Pubblici"
alias youtube-mp3='youtube-dl --extract-audio --audio-format mp3  --audio-quality 0'
alias youtube-video="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias myip=' sudo wget -qO- http://ipecho.net/plain'



