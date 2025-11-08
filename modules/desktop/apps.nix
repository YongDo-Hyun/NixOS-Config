{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    htop
    fastfetch
    firefox-bin
    hyprland
    waybar
    rofi-wayland
    kdePackages.dolphin
    kdePackages.konsole
    hyprpaper
    kdePackages.kdeconnect-kde
    wl-clipboard
    cliphist
    easyeffects
    kdePackages.polkit-kde-agent-1
    qt6.qtwayland
    kdePackages.kirigami
    qt6.qtdeclarative
    mako
    hypridle
    steam
    networkmanagerapplet
    neovim-unwrapped
    vlc
    hyprlock
    hyprcursor
    hyprpicker
    wlogout
    cloudflared
    discord
    vscode
    vesktop
    vencord
    spotify
    obs-studio
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        obs-multi-rtmp
      ];
    })
    polkit_gnome
    prismlauncher
    heroic
    lutris
    peazip
    gimp3
    kdePackages.kdenlive
    google-chrome
    brave
    tor-browser
    kitty
    thunderbird-bin
    mcaselector
    btop
    gnome-disk-utility
    p7zip
    unzip
    zip
    gcc
    clang
    cmake
    pkg-config
    gnumake
    python3
    nodejs
    mangohud
    gamescope
    vkbasalt
    goverlay
    protonup-qt
    qpwgraph
    helvum
    ffmpeg-full
    waybar-mpris
    grim
    slurp
    swappy
    playerctl
    nmap
    iperf3
    httrack
    tailscale
    bottles
    pavucontrol
    gh
    unrar
    ripgrep
    appimage-run
    sddm-astronaut
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    kdePackages.qtvirtualkeyboard
    killall
    microfetch
    tldr
    nix-prefetch-scripts
    libjxl
    fzf
    fd
    jq
    lm_sensors
    virt-viewer # View Virtual Machines
    spice
    spice-gtk
    spice-protocol
    spice-vdagent
    win-virtio
    win-spice
    lazydocker
    docker-client
    lf
    hyprpolkitagent
    flatpak
  ];
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 3";
    };
    flake = "/etc/nixos#default";
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.virt-manager.enable = true;
}
