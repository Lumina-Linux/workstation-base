#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="lumina"
iso_label="LUMINA-WORKSTATION_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Lumina Linux"
iso_application="Lumina Linux Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/bin/calamares"]="0:0:755"
  ["/usr/bin/lumina-calamares"]="0:0:755"
  ["/etc/skel/Desktop"]="0:0:0755"
  ["/etc/skel/Desktop/instalar-lumina.desktop"]="0:0:0755"
  ["/etc/profile.d/live-desktop.sh"]="0:0:0755"
  ["/usr/local/bin/lumina-postinstall.sh"]="0:0:755"
)
