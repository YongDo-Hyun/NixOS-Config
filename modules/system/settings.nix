{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.nvidia.acceptLicense = true;
  nixpkgs.config.cudaSupport = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
  nix.settings.download-buffer-size = 2147483648;
  nix.settings.warn-dirty = false;
  nix.settings.keep-outputs = true;
  nix.settings.keep-derivations = true;
  nix.optimise.automatic = true;
  nix.package = pkgs.nixVersions.latest;
  nix.settings.allowed-users = [ "samet" ];
  nixpkgs.config.permittedInsecurePackages = [
    "gradle-7.6.6"
  ];
  system.stateVersion = "25.05"; # Degistirme!
}
