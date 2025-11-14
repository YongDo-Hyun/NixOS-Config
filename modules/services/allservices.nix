{ config, pkgs, lib, ... }:

{
  services.fstrim.enable = true;
  services.libinput.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  services.tailscale.enable = true;
  systemd.services.ydotoold = {
    description = "ydotool daemon";
    wantedBy = [ "multi-user.target" ];
    after = [ "graphical.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.ydotool}/bin/ydotoold --socket-path=/run/ydotoold/socket";
      User = "root";
      Group = "root";
    };
  };
  systemd.tmpfiles.rules = [
    "d /run/ydotoold 0755 root root -"
  ];

}
