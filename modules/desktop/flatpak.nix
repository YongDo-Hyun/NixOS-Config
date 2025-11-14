{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services = {
    flatpak = {
      enable = true;

      packages = [
        "com.github.tchx84.Flatseal"     # Flatseal - izin yöneticisi
        "io.github.flattool.Warehouse"   # Flatpak temizleyici / yöneticisi
        "com.modrinth.ModrinthApp"       # Modrinth App (Electron tabanlı, Wayland uyumlu)
        "net.codelogistics.clicker"
      ];

      update.onActivation = true;
    };
  };
}
