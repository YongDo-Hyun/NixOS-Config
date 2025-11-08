{ config, pkgs, lib, ... }:

{
  users.users.samet = {
    isNormalUser = true;
    extraGroups = [
      "wheel"          # Enable ‘sudo’ for the user.
      "networkmanager" # ağ yöneticisi
      "video"          # GPU erişimi
      "audio"          # ses sistemi
      "input"          # klavye / fare erişimi
      "libvirtd"
      "kvm"
      "docker"
    ];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };
}
