{ config, pkgs, lib, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.nameservers = [ "127.0.0.1" ];
  networking.useDHCP = false;
  services.resolved.enable = false;
  networking.networkmanager.dns = "none";
  systemd.services."cloudflared-dns" = {
    description = "Cloudflare DNS-over-HTTPS local resolver";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
    ExecStart = "${pkgs.cloudflared}/bin/cloudflared proxy-dns --port 53 --upstream https://dns.quad9.net/dns-query ";
    Restart = "always";
    User = "root";
    };
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22 # SSH (Secure Shell) - remote access
      53
      80 # HTTP - web traffic
      443 # HTTPS - encrypted web traffic
      5335
      59010 # Custom application port
      59011 # Custom application port
      8080 # Alternative HTTP/web server port
    ];
    allowedUDPPorts = [
      53
      5335
      59010 # Custom application port
      59011 # Custom application port
    ];
  };
  services.openssh.enable = true;
  services.openssh.ports = [ 22 ];
  services.openssh.settings.PasswordAuthentication = true;
  services.openssh.settings.KbdInteractiveAuthentication = true;
  services.openssh.settings.UseDns = true;
  services.openssh.settings.X11Forwarding = false;
  services.openssh.settings.PermitRootLogin = "prohibit-password";
}
