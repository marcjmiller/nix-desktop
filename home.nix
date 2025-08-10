{
  pkgs,
  ...
}:
let
  inherit (import ./nixos-desktop/variables.nix)
    wallpaperImg
    ;
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

  home = {
    username = "marcm";
    homeDirectory = "/home/marcm";
    
    # Packages to install
    packages = with pkgs; [
      bat
      blueman
      bluez
      bluez-tools
      btop
      cliphist
      direnv
      dnsutils
      eza
      fzf
      gawk
      gnupg
      kitty
      libarchive
      libsecret
      nerd-fonts.hasklug
      nerd-fonts.jetbrains-mono
      nerd-fonts.victor-mono
      nil
      nixd
      oh-my-zsh
      orca-slicer
      p7zip
      pavucontrol
      protonup-rs
      pciutils
      tealdeer
      xfce.thunar
      xfce.thunar-volman
      tree
      unzip
      usbutils
      vesktop
      wl-clipboard-rs
      xz
      zip
      zoom-us
      zsh-powerlevel10k
    ];

    # Files to import into system
    file = {
      "Pictures/Wallpapers" = {
        source = ./nixos-desktop/files/wallpapers;
        recursive = true;
      };
    };

    # Originally installed version of NixOS
    stateVersion = "25.05";
  };

  programs = {
    lutris.enable = true;
    neovim.enable = true;
    yazi.enable = true;
  };

  services = {
    blueman-applet = {
      enable = true;
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
