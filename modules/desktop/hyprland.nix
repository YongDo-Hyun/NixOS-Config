{ config, pkgs, lib, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.settings.General.InputMethod = "";
  services.displayManager.sddm.autoNumlock = true;
  services.displayManager.sddm.theme = "sddm-astronaut-theme";
  services.displayManager.sddm.extraPackages = with pkgs; [
    sddm-astronaut
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    kdePackages.qtvirtualkeyboard
  ];
  services.displayManager.sddm.settings.X11.KeyboardLayout = "tr";
  programs.hyprland.enable = true;
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    PIPEWIRE_LATENCY = "1024/48000";
    PIPEWIRE_QUANTUM = "1024/48000";
    NIXOS_OZONE_WL = "1";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_BIN_HOME = "$HOME/.local/bin";
  };
}
