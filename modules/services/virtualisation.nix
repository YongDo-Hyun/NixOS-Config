{ config, lib, pkgs, ... }:

{
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.extraConfig = ''
    firewall_backend="nftables"
  '';
  virtualisation.libvirtd.qemu.package = pkgs.qemu_kvm;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
  virtualisation.virtualbox.host.enable = false;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  services.spice-webdavd.enable = true;
}
