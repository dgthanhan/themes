#!/bin/sh

sudo dnf -y install @xfce-desktop-environment
sudo dnf install -y xfce4-whiskermenu-plugin arc-theme paper-icon-theme xfce4-panel-profiles

mkdir -p ~/.themes/Evolus-XHDPI
curl -0 -L https://github.com/dgthanhan/themes/raw/master/setup/xfce/files/Evolus-XHDPI.tar.gz -o ~/.themes/Evolus-XHDPI.tar.gz
tar -xvf ~/.themes/Evolus-XHDPI.tar.gz --directory ~/.themes/Evolus-XHDPI

mkdir -p ~/.fonts/ProductSans
curl -0 -L https://github.com/dgthanhan/themes/raw/master/setup/xfce/files/Product-Sans-VH.tar.gz -o ~/.fonts/Product-Sans-VH.tar.gz
tar -xvf ~/.fonts/Product-Sans-VH.tar.gz --directory ~/.fonts/ProductSans

mkdir -p ~/.config/gtk-3.0/
curl -0 -L https://github.com/dgthanhan/themes/raw/master/setup/xfce/files/gtk.css -o ~/.config/gtk-3.0/gtk.css

curl -0 -L https://github.com/dgthanhan/themes/raw/master/setup/xfce/files/PanelProfile-convit.tar.bz2 -o ~/PanelProfile-convit.tar.bz2
xfce4-panel-profiles load ~/PanelProfile-convit.tar.bz2

xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Lighter"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Paper"
xfconf-query -c xfwm4 -p /general/theme -s Evolus-XHDPI
xfconf-query -c xfwm4 -p /general/title_font -s "SVN-Product Sans Bold 12"
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 2
xfconf-query -c xsettings -p /Gtk/FontName -s "SVN-Product Sans 10"


echo "export QT_SCALE_FACTOR=2" >> ~/.bashrc
echo "export GDK_SCALE=2" >> ~/.bashrc


echo "Please log out and back in."

