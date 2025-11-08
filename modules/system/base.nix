{ config, lib, pkgs, ... }:

{
  boot.supportedFilesystems = [ "ntfs" "exfat" "ext4" "fat32" "btrfs" ];
  boot.tmp.cleanOnBoot = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "preempt=full" "nvidia-drm.modeset=1" "nvidia_drm.fbdev=1" ];
  security.polkit.enable = true;
}
