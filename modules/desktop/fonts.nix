{ config, pkgs, lib, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    font-awesome
    material-design-icons
    powerline-fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
  fonts.enableDefaultPackages = true;
  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.emoji = [ "Noto Color Emoji" ];
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Noto Sans" ];
  fonts.fontconfig.defaultFonts.serif = [ "Noto Serif" ];
}
