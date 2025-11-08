{ host, inputs, ... }:

{
  final: prev: {
  # NUR (Nix User Repository)
  nur = import inputs.nur {
    inherit (final) pkgs;
  };

  # Stable channel — erişim: pkgs.stable.<paket>
  stable = import inputs.nixpkgs-stable {
    system = final.system;
    config.allowUnfree = true;
  };

  # Discord override
  discord = prev.discord.override {
    withVencord = true;
    withOpenASAR = true;
  };

  # Vesktop override
  vesktop = prev.vesktop.override {
    withSystemVencord = false;
    withMiddleClickScroll = true;
  };

  # Örnek: kendi paketlerini eklemek istersen (ileride)
  # myPkgs = import ../../pkgs { pkgs = final; };
}
