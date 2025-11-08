{ config, pkgs, lib, ... }:

{
  services.syncthing = {
    enable = true;
    user = "samet";
    dataDir = "/home/samet";
    configDir = "/home/samet/.config/syncthing";
  };
}
