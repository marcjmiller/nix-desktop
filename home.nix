{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  inherit (import ./nixos-desktop/variables.nix)
    wallpaperImg
    ;

  rocm = with pkgs.rocmPackages; [
    rocm-core
    rocminfo
    rocm-runtime
    rocm-device-libs
    rocm-smi
    rocblas
    rocfft
    rocrand
    rocsparse
    rocsolver
    rccl
    rocm-cmake
    rocminfo
    hipblas
    hipsparse
    hipfft
    hip-common
    miopen
  ];
in
{
  imports = [
    ./nixos-desktop/browser
    ./nixos-desktop/editor
    ./nixos-desktop/shell
    ./nixos-desktop/tools
    ./nixos-desktop/waybar
    ./nixos-desktop/wm
    
    inputs.kickstart-nixvim.homeManagerModules.default
  ];

  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };

  home = {
    username = "marcm";
    homeDirectory = "/home/marcm";

    # Packages to install
    packages =
      rocm
      ++ (with pkgs; [
        antimicrox
        appimage-run
        bat
        blueman
        bluez
        bluez-tools
        brightnessctl
        btop
        catppuccinifier-cli
        cliphist
        corefonts
        delta
        direnv
        dnsutils
        dotnet-aspnetcore_9
        eza
        fastfetch
        fd
        ffmpeg-full
        file-roller
        freetype
        fzf
        gawk
        gcc
        gimp3
        glib
        gnupg
        go
        gopls
        grim
        imagemagick
        kitty
        libarchive
        libGL
        libsecret
        libv4l
        lmstudio
        mangohud
        nerd-fonts.hasklug
        nerd-fonts.jetbrains-mono
        nerd-fonts.victor-mono
        networkmanager-openvpn
        nil
        nixd
        nodejs_24
        nvtopPackages.amd
        oh-my-zsh
        openssl
        p7zip
        pavucontrol
        pciutils
        protontricks
        protonup-rs
        inputs.pyprland.packages.${pkgs.system}.default
        ripgrep
        slurp
        stdenv.cc.cc.lib
        steamtinkerlaunch
        swappy
        tealdeer
        tree
        tree-sitter
        unrar
        unzip
        usbutils
        vesktop
        vial
        winetricks
        wl-clipboard-rs
        xfce.thunar
        xfce.thunar-volman
        xnviewmp
        xz
        zenity
        zip
        zlib
        zoom-us
        zsh-powerlevel10k
        zstd
      ]);

    # Files to import into system
    file = {
      "Pictures/Wallpapers" = {
        source = ./nixos-desktop/files/wallpapers;
        recursive = true;
      };
      ".config/scripts" = {
        source = ./nixos-desktop/files/scripts;
        recursive = true;
      };
      ".config/hypr/pyprland.toml" = {
        source = ./nixos-desktop/files/hyprland/pyprland.toml;
      };
    };

    sessionVariables = {
      HSA_OVERRIDE_GFX_VERSION = "11.0.0";
      LD_LIBRARY_PATH = lib.makeLibraryPath (
        rocm
        ++ [
          pkgs.glib
          pkgs.libGL
          pkgs.stdenv.cc.cc.lib
          pkgs.zlib
          pkgs.zstd
        ]
      );
    };

    # Originally installed version of NixOS
    stateVersion = "25.05";
  };

  programs = {
    lutris.enable = true;
    mpv.enable = true;
    nixvim.enable = true;
    yazi.enable = true;
  };

  services = {
    blueman-applet = {
      enable = true;
    };

    clipse = {
      enable = true;
      allowDuplicates = false;
      historySize = 150;
      imageDisplay.type = "kitty";
    };

    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
          after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
          before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        };

        listener = [
          {
            timeout = 150; # 2.5min - dim the screen
            on-timeout = "${pkgs.brightnessctl} -s set 10";
            on-resume = "${pkgs.brightnessctl} -r";
          }
          {
            timeout = 300; # 5 minutes - lock the screen
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 600; # 10 minutes - turn off displays
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on && ${pkgs.brightnessctl} -r";
          }
          {
            timeout = 1200; # 20 minutes - suspend system
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };

    network-manager-applet = {
      enable = true;
    };
  };

  stylix = {
    enable = true;

    cursor.package = pkgs.adwaita-icon-theme;
    cursor.name = "Adwaita";
    cursor.size = 16;
    image = ./nixos-desktop/files/wallpapers/${wallpaperImg};
    opacity = {
      desktop = 0.90;
      popups = 0.90;
      terminal = 0.90;
    };
    polarity = "dark";
    targets = {
      fuzzel.enable = true;
      kitty.enable = true;
      firefox = {
        enable = true;
        profileNames = [ "default" ];
      };
    };
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 157;
  };
}
