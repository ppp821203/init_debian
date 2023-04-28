#!/bin/bash

#organize download folder
#Image Files
cd ~/Downloads

touch ~/Downloads

# Image Files
mv *.png *.jpg *.jpeg *.tif *.tiff *.bpm *.gif *.eps *.raw ~/Pictures 2> /dev/null

# Audio Files 
mv *.mp3 *.m4a *.flac *.aac *.ogg *.wav ~/Music 2> /dev/null

# Video Files 
mv *.mp4 *.mov *.avi *.mpg *.mpeg *.webm *.mpv *.mp2 *.wmv ~/Videos 2> /dev/null

# PDFs 
mv *.pdf *.doc *.txt *.ppt *.xls *.xlsx *.ovpn ~/Documents 2> /dev/null

# Scripts
mv *.py *.rb *.sh ~/git/linux_init/script 2> /dev/null

#Compressed Files
mv *.rar *.zip *.tar *.tar.gz *.7z *.deb *.AppImage *.flatpakref ~/Downloads/zip 2> /dev/null

# Iso
mv *.iso ~/Downloads/iso 2> /dev/null

rm *.ovpn 2> /dev/null


#obs not work
#https://unix.stackexchange.com/questions/552688/is-it-possible-to-roll-back-a-flatpak-update
#flatpak remote-info --log flathub com.obsproject.Studio
#cat ~/.key | sudo -S flatpak update -y --commit=694f40fda5aea03f5daf53db094cdcc5c29e62fa507d49d5bcfe399c55809ecd com.obsproject.Studio

rm -rf /home/$USER/.var/app/com.usebottles.bottles/data/bottles/temp/*

rsync -a --delete --exclude-from /home/$USER --exclude .local/share/Trash --exclude .local/share/flatpak --exclude phone/Tachiyomi --exclude Games --exclude Downloads/iso --exclude .cache  /home/$USER/ /media/$USER/backup_disk/$USER/

#rsync -a --delete /home/http/ /media/$USER/backup_disk/http/

dconf dump / > /home/$USER/git/linux_init/gnome-shell/dconf_backup
#dconf load / < /home/$USER/git/linux_init/gnome-shell/dconf_backup

notify-send 'Complete' 'Organizing your downloads Folder'
