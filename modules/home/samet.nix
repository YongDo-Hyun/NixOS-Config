{ config, pkgs, ... }:
{
  home.username = "samet";
  home.homeDirectory = "/home/samet";
  home.stateVersion = "25.05";

  # Shell programlarını etkinleştir
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 100000;
    shellAliases = {
      sedit = "sudo nvim";
      garbage = "sudo nix-collect-garbage -d";
      edit = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#default";
      ff = "fastfetch";
      ll = "ls -lah";
      lf = ''
          {
            tmp="$(mktemp)"
            # `command` is needed in case `lfcd` is aliased to `lf`
            command lf -last-dir-path="$tmp" "$@"
            if [ -f "$tmp" ]; then
                dir="$(cat "$tmp")"
                rm -f "$tmp"
                if [ -d "$dir" ]; then
                    if [ "$dir" != "$(pwd)" ]; then
                        cd "$dir"
                    fi
                fi
            fi
           }
          '';
    };
    initContent = ''
      if command -v starship &>/dev/null; then
        eval "$(starship init zsh)"
      fi
      if command -v fastfetch &> /dev/null; then
        fastfetch
      fi
      if command -v direnv &>/dev/null; then
        eval "$(direnv hook zsh)"
      fi
    '';
    shellGlobalAliases = {
      UUID = "$(uuidgen | tr -d \\n)";
      G = "| grep";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; # fark etmez, Starship override eder
      plugins = [ "git" "sudo" "git" "gitignore" "z" "colored-man-pages" ];
    };
  };
  programs.starship.enable = true;
  programs.starship.settings.add_newline = false;
  programs.starship.settings.scan_timeout = 10;
  programs.starship.settings.format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$python$nix_shell$character";
  programs.starship.settings.directory.truncate_to_repo = false;
  programs.starship.settings.directory.read_only = " ro";
  programs.starship.settings.directory.style = "#57C7FF";
  programs.starship.settings.character.success_symbol = "[❯](#FF6AC1)";
  programs.starship.settings.character.error_symbol = "[❯](#FF5C57)";
  programs.starship.settings.character.vimcmd_symbol = "[❮](bright-green)";
  programs.starship.settings.git_branch.format = "[$branch]($style)";
  programs.starship.settings.git_branch.symbol = "git ";
  programs.starship.settings.git_branch.style = "242";
  programs.starship.settings.git_status.format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
  programs.starship.settings.git_status.style = "cyan";
  programs.starship.settings.git_status.conflicted = "​";
  programs.starship.settings.git_status.untracked = "​";
  programs.starship.settings.git_status.modified = "​";
  programs.starship.settings.git_status.staged = "​";
  programs.starship.settings.git_status.renamed = "​";
  programs.starship.settings.git_status.deleted = "​";
  programs.starship.settings.git_status.stashed = "≡";
  programs.starship.settings.git_state.format = ''\([$state( $progress_current/$progress_total)]($style)\) '';
  programs.starship.settings.git_state.style = "bright-black";
  programs.starship.settings.cmd_duration.format = "[$duration]($style) ";
  programs.starship.settings.cmd_duration.style = "yellow";
  programs.starship.settings.aws.symbol = "aws ";
  programs.starship.settings.azure.symbol = "az ";
  programs.starship.settings.bun.symbol = "bun ";
  programs.starship.settings.cmake.symbol = "cmake ";
  programs.starship.settings.deno.symbol = "deno ";
  programs.starship.settings.docker_context.symbol = "docker ";
  programs.starship.settings.golang.symbol = "go ";
  programs.starship.settings.lua.symbol = "lua ";
  programs.starship.settings.nodejs.symbol = "nodejs ";
  programs.starship.settings.memory_usage.symbol = "memory ";
  programs.starship.settings.nim.symbol = "nim ";
  programs.starship.settings.nix_shell.symbol = "❄️ ";
  programs.starship.settings.nix_shell.format = "[$symbol]($style)";
  programs.starship.settings.shell.disabled = false;
  programs.starship.settings.shell.style = "cyan";
  programs.starship.settings.shell.bash_indicator = "";
  programs.starship.settings.shell.powershell_indicator = "";
  programs.starship.settings.package.symbol = "pkg ";
  programs.starship.settings.purescript.symbol = "purs ";
  programs.starship.settings.python.format = "[$virtualenv]($style) ";
  programs.starship.settings.python.style = "bright-black";
  programs.starship.settings.python.symbol = "py ";
  programs.starship.settings.rust.symbol = "rs ";
  programs.starship.settings.status.symbol = "[x](bold red) ";
  programs.starship.settings.sudo.symbol = "sudo ";
  programs.starship.settings.terraform.symbol = "terraform ";
  programs.starship.settings.zig.symbol = "zig ";
  programs.starship.settings.os.symbols.Alpaquita = "alq ";
  programs.starship.settings.os.symbols.Alpine = "alp ";
  programs.starship.settings.os.symbols.Amazon = "amz ";
  programs.starship.settings.os.symbols.Android = "andr ";
  programs.starship.settings.os.symbols.Arch = "rch ";
  programs.starship.settings.os.symbols.Artix = "atx ";
  programs.starship.settings.os.symbols.CentOS = "cent ";
  programs.starship.settings.os.symbols.Debian = "deb ";
  programs.starship.settings.os.symbols.DragonFly = "dfbsd ";
  programs.starship.settings.os.symbols.Emscripten = "emsc ";
  programs.starship.settings.os.symbols.EndeavourOS = "ndev ";
  programs.starship.settings.os.symbols.Fedora = "fed ";
  programs.starship.settings.os.symbols.FreeBSD = "fbsd ";
  programs.starship.settings.os.symbols.Garuda = "garu ";
  programs.starship.settings.os.symbols.Gentoo = "gent ";
  programs.starship.settings.os.symbols.HardenedBSD = "hbsd ";
  programs.starship.settings.os.symbols.Illumos = "lum ";
  programs.starship.settings.os.symbols.Linux = "lnx ";
  programs.starship.settings.os.symbols.Mabox = "mbox ";
  programs.starship.settings.os.symbols.Macos = "mac ";
  programs.starship.settings.os.symbols.Manjaro = "mjo ";
  programs.starship.settings.os.symbols.Mariner = "mrn ";
  programs.starship.settings.os.symbols.MidnightBSD = "mid ";
  programs.starship.settings.os.symbols.Mint = "mint ";
  programs.starship.settings.os.symbols.NetBSD = "nbsd ";
  programs.starship.settings.os.symbols.NixOS = "nix ";
  programs.starship.settings.os.symbols.OpenBSD = "obsd ";
  programs.starship.settings.os.symbols.OpenCloudOS = "ocos ";
  programs.starship.settings.os.symbols.openEuler = "oeul ";
  programs.starship.settings.os.symbols.openSUSE = "osuse ";
  programs.starship.settings.os.symbols.OracleLinux = "orac ";
  programs.starship.settings.os.symbols.Pop = "pop ";
  programs.starship.settings.os.symbols.Raspbian = "rasp ";
  programs.starship.settings.os.symbols.Redhat = "rhl ";
  programs.starship.settings.os.symbols.RedHatEnterprise = "rhel ";
  programs.starship.settings.os.symbols.Redox = "redox ";
  programs.starship.settings.os.symbols.Solus = "sol ";
  programs.starship.settings.os.symbols.SUSE = "suse ";
  programs.starship.settings.os.symbols.Ubuntu = "ubnt ";
  programs.starship.settings.os.symbols.Unknown = "unk ";
  programs.starship.settings.os.symbols.Windows = "win ";
  home.file.".config/hypr/nixscripts/polkit-agent.sh".text = ''
    #!/usr/bin/env bash
    if ! pgrep -x "polkit-gnome-authentication-agent-1" > /dev/null; then
        /run/current-system/sw/libexec/polkit-gnome-authentication-agent-1 &
    fi
  '';

  home.file.".config/hypr/nixscripts/polkit-agent.sh".executable = true;
  home.file.".config/hypr/hyprland.conf".source = ../../dotfiles/hypr/hyprland.conf;
  home.file.".config/hypr/hypridle.conf".source = ../../dotfiles/hypr/hypridle.conf;
  home.file.".config/hypr/hyprlock.conf".source = ../../dotfiles/hypr/hyprlock.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ../../dotfiles/hypr/hyprpaper.conf;
  home.file.".config/hypr/wallust/wallust-hyprland.conf".source = ../../dotfiles/hypr/wallust/wallust-hyprland.conf;
  home.file.".config/hypr/Scripts".source = ../../dotfiles/hypr/Scripts;
  home.file.".config/waybar/config".source = ../../dotfiles/waybar/waybar/config;
  home.file.".config/waybar/style.css".source = ../../dotfiles/waybar/waybar/style.css;
  home.file.".config/waybar/mediaplayer.py".source = ../../dotfiles/waybar/waybar/mediaplayer.py;
  home.file.".config/waybar/Modules".source = ../../dotfiles/waybar/waybar/Modules;
  home.file.".config/waybar/modules".source = ../../dotfiles/waybar/waybar/modules;
  home.file.".config/waybar/ModulesCustom".source = ../../dotfiles/waybar/waybar/ModulesCustom;
  home.file.".config/waybar/ModulesGroups".source = ../../dotfiles/waybar/waybar/ModulesGroups;
  home.file.".config/waybar/ModulesWorkspaces".source = ../../dotfiles/waybar/waybar/ModulesWorkspaces;
  home.file.".config/waybar/wallust".source = ../../dotfiles/waybar/waybar/wallust;
  home.file.".config/waybar/waybar.sh".source = ../../dotfiles/waybar/waybar/waybar.sh;
  # --- Others Dotfiles ---

  # Fastfetch configs
  home.file.".config/fastfetch/config.jsonc".source = ../../dotfiles/others/fastfetch/config.jsonc;
  home.file.".config/fastfetch/config-compact.jsonc".source = ../../dotfiles/others/fastfetch/config-compact.jsonc;
  home.file.".config/fastfetch/config-v2.jsonc".source = ../../dotfiles/others/fastfetch/config-v2.jsonc;
  home.file.".config/fastfetch/nixos.png".source = ../../dotfiles/others/fastfetch/nixos.png;

  # Fcitx (input method)

  # Kate external tools
  home.file.".local/share/kate/externaltools".source = ../../dotfiles/others/kate/externaltools;

  # Neovim configs
  home.file.".config/nvim/init.lua".source = ../../dotfiles/others/nvim/init.lua;
  home.file.".config/nvim/init.vim.txt".source = ../../dotfiles/others/nvim/init.vim.txt;
  home.file.".config/nvim/lazy-lock.json".source = ../../dotfiles/others/nvim/lazy-lock.json;
  home.file.".config/nvim/lua".source = ../../dotfiles/others/nvim/lua;

  # Rofi config
  home.file.".config/rofi/config.rasi".text = ''
  @theme "${pkgs.rofi}/share/rofi/themes/Arc-Dark.rasi"

  configuration {
      modi: "drun,run,window,ssh";
      show-icons: true;
      icon-theme: "Papirus-Dark";
      display-drun: "Apps";
      display-run: "Run";
      display-window: "Windows";
      display-ssh: "SSH";
      font: "JetBrainsMono Nerd Font 11";
      drun-display-format: "{icon} {name}";
      location: 0;
      yoffset: 0;
      xoffset: 0;
      padding: 20;
      fullscreen: false;
      fixed-num-lines: true;
      line-margin: 6;
      line-padding: 6;
      width: 40;
      columns: 1;
      scroll-method: 0;
      window-format: "{w} · {c}";
      matching: "fuzzy";
      cycle: true;
      normalize-match: true;
      case-sensitive: false;
      sort: true;
      sidebar-mode: false;
  }

  @import "${pkgs.rofi}/share/rofi/themes/Arc-Dark.rasi"

  * {
      background-color: #1e1e2e;
      border-color: #44475a;
      border-radius: 8px;
      text-color: #f8f8f2;
      selected-normal-foreground: #282a36;
      selected-normal-background: #bd93f9;
      urgent-foreground: #ff5555;
      border: 2;
      spacing: 8;
  }
  '';

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.libsForQt5.breeze-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  xdg.configFile."kdeglobals".text = ''
  [ColorEffects:Disabled]
  ChangeSelectionColor=
  Color=56,56,56
  ColorAmount=0
  ColorEffect=0
  ContrastAmount=0.65
  ContrastEffect=1
  Enable=
  IntensityAmount=0.1
  IntensityEffect=2

  [ColorEffects:Inactive]
  ChangeSelectionColor=true
  Color=112,111,110
  ColorAmount=0.025
  ColorEffect=2
  ContrastAmount=0.1
  ContrastEffect=2
  Enable=false
  IntensityAmount=0
  IntensityEffect=0

  [Colors:Button]
  BackgroundAlternate=30,87,116
  BackgroundNormal=49,54,59
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=61,174,233
  ForegroundInactive=161,169,177
  ForegroundLink=29,153,243
  ForegroundNegative=218,68,83
  ForegroundNeutral=246,116,0
  ForegroundNormal=252,252,252
  ForegroundPositive=39,174,96
  ForegroundVisited=155,89,182

  [Colors:Complementary]
  BackgroundAlternate=30,87,116
  BackgroundNormal=42,46,50
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=61,174,233
  ForegroundInactive=161,169,177
  ForegroundLink=29,153,243
  ForegroundNegative=218,68,83
  ForegroundNeutral=246,116,0
  ForegroundNormal=252,252,252
  ForegroundPositive=39,174,96
  ForegroundVisited=155,89,182

  [Colors:Header]
  BackgroundAlternate=42,46,50
  BackgroundNormal=49,54,59
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=61,174,233
  ForegroundInactive=161,169,177
  ForegroundLink=29,153,243
  ForegroundNegative=218,68,83
  ForegroundNeutral=246,116,0
  ForegroundNormal=252,252,252
  ForegroundPositive=39,174,96
  ForegroundVisited=155,89,182

  [Colors:Header][Inactive]
  BackgroundAlternate=49,54,59
  BackgroundNormal=42,46,50
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=61,174,233
  ForegroundInactive=161,169,177
  ForegroundLink=29,153,243
  ForegroundNegative=218,68,83
  ForegroundNeutral=246,116,0
  ForegroundNormal=252,252,252
  ForegroundPositive=39,174,96
  ForegroundVisited=155,89,182

  [Colors:Selection]
  BackgroundAlternate=30,87,116
  BackgroundNormal=61,174,233
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=252,252,252
  ForegroundInactive=161,169,177
  ForegroundLink=253,188,75
  ForegroundNegative=176,55,69
  ForegroundNeutral=198,92,0
  ForegroundNormal=252,252,252
  ForegroundPositive=23,104,57
  ForegroundVisited=155,89,182

  [Colors:Tooltip]
  BackgroundAlternate=42,46,50
  BackgroundNormal=49,54,59
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=61,174,233
  ForegroundInactive=161,169,177
  ForegroundLink=29,153,243
  ForegroundNegative=218,68,83
  ForegroundNeutral=246,116,0
  ForegroundNormal=252,252,252
  ForegroundPositive=39,174,96
  ForegroundVisited=155,89,182

  [Colors:View]
  BackgroundAlternate=35,38,41
  BackgroundNormal=27,30,32
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=61,174,233
  ForegroundInactive=161,169,177
  ForegroundLink=29,153,243
  ForegroundNegative=218,68,83
  ForegroundNeutral=246,116,0
  ForegroundNormal=252,252,252
  ForegroundPositive=39,174,96
  ForegroundVisited=155,89,182

  [Colors:Window]
  BackgroundAlternate=49,54,59
  BackgroundNormal=42,46,50
  DecorationFocus=61,174,233
  DecorationHover=61,174,233
  ForegroundActive=61,174,233
  ForegroundInactive=161,169,177
  ForegroundLink=29,153,243
  ForegroundNegative=218,68,83
  ForegroundNeutral=246,116,0
  ForegroundNormal=252,252,252
  ForegroundPositive=39,174,96
  ForegroundVisited=155,89,182

  [General]
  ColorSchemeHash=98139d0bac64c4e9f97721675584832c7c7a0bf0

  [KDE]
  LookAndFeelPackage=org.kde.breezedark.desktop

  [WM]
  activeBackground=49,54,59
  activeBlend=252,252,252
  activeForeground=252,252,252
  inactiveBackground=42,46,50
  inactiveBlend=161,169,177
  inactiveForeground=161,169,177
  '';

  home.file.".local/share/flatpak/overrides/com.modrinth.ModrinthApp".text = ''
    [Environment]
    GDK_BACKEND=x11
    WEBKIT_DISABLE_DMABUF_RENDERER=1
    WEBKIT_DISABLE_WAYLAND_DMABUF=1
    WEBKIT_DISABLE_COMPOSITING_MODE=1
  '';

  # Git kimliğini ayarla
  programs.git = {
    enable = true;
    userName = "YongDo-Hyun";
    userEmail = "froster12@naver.com";
  };
  # Ortam değişkenleri
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
  };
}

