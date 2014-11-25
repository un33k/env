$ cat mk.osx.iso.sh
#!/bin/bash

OS="Yosemite"
IMG_SIZE=8g
BUILD_MNT=/tmp/"$OS"_Build
INSTALL_MNT=/tmp/"$OS"_Install
INSTALL_DMG=/Applications/Install\ OS\ X\ "$OS".app/Contents/SharedSupport/InstallESD.dmg
OS_CDR=/tmp/"$OS"

######################################
hdiutil attach "$INSTALL_DMG" -noverify -nobrowse -mountpoint "$INSTALL_MNT"
hdiutil convert "$INSTALL_MNT"/BaseSystem.dmg -format UDSP -o "$OS_CDR"
hdiutil resize -size $IMG_SIZE "$OS_CDR".sparseimage
hdiutil attach "$OS_CDR".sparseimage -noverify -nobrowse -mountpoint "$BUILD_MNT"
rm -rf "$BUILD_MNT"/System/Installation/Packages
cp -rp "$INSTALL_MNT"/Packages "$BUILD_MNT"/System/Installation/
hdiutil detach "$BUILD_MNT"
hdiutil detach "$INSTALL_MNT"
hdiutil convert "$OS_CDR".sparseimage -format UDTO -o "$OS_CDR"
rm "$OS_CDR".sparseimage
mv "$OS_CDR".cdr ~/Desktop/$OS.iso
