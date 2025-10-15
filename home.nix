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
    clr
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
        btop
        catppuccinifier-cli
        cliphist
        delta
        direnv
        dnsutils
        eza
        fastfetch
        ffmpeg-full
        file-roller
        fzf
        gamemode
        gawk
        glib
        gnupg
        grim
        imagemagick
        kitty
        libarchive
        libGL
        libsecret
        libv4l
        lmstudio
        nerd-fonts.hasklug
        nerd-fonts.jetbrains-mono
        nerd-fonts.victor-mono
        networkmanager-openvpn
        nil
        nixd
        nvtopPackages.amd
        oh-my-zsh
        p7zip
        pavucontrol
        pciutils
        protontricks
        protonup-rs
        inputs.pyprland.packages.${pkgs.system}.default
        slurp
        stdenv.cc.cc.lib
        swappy
        tealdeer
        tree
        unrar
        unzip
        usbutils
        vesktop
        winetricks
        wl-clipboard-rs
        xfce.thunar
        xfce.thunar-volman
        xnviewmp
        xz
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
    neovim.enable = true;
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
