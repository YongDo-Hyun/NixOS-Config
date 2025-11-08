{ config, pkgs, lib, ... }:

{
  services.fstrim.enable = true;
  services.libinput.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
}
