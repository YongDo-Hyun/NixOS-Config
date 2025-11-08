{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/base.nix
      ../../modules/system/boot.nix
      ../../modules/system/cache.nix
      ../../modules/system/locale.nix
      ../../modules/system/network.nix
      ../../modules/system/nvidia.nix
      ../../modules/system/settings.nix
      ../../modules/system/users.nix

      ../../modules/services/allservices.nix
      ../../modules/services/bluetooth.nix
      ../../modules/services/gaming.nix
      ../../modules/services/pipewire.nix
      ../../modules/services/printing.nix
      ../../modules/services/syncthing.nix
      ../../modules/services/virtualisation.nix
      ../../modules/services/zapret.nix

      ../../modules/desktop/apps.nix
      ../../modules/desktop/fonts.nix
      ../../modules/desktop/hyprland.nix
      ../../modules/desktop/flatpak.nix
    ];
}
