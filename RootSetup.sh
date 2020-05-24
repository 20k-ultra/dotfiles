# Update packages
pacman -Syu

# Install packages
pacman -S --needed $(comm -12 <(pacman -Slq|sort) <(sort rootPkg.list) )

# Create directories
mkdir /etc/systemd/system
mkdir /usr/local/bin

# Copy system wide configurations/scripts
cp -r etc /etc
cp usr/lib/systemd/system-sleep/PciFullRescanOnWake.sh /usr/lib/systemd/system-sleep/
cp usr/local/bin/* /usr/local/bin/

# Tag scripts as executable
chmod +x /usr/lib/systemd/system-sleep/PciFullRescanOnWake.sh
chmod +x /usr/local/bin/*

# Setup packages
pkgfile --update