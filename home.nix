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

  nixpkgs.config.allowUnfree = true;
    
  home = {
    username = "marcm";
    homeDirectory = "/home/marcm";

    # Packages to install
    packages = with pkgs; [
      antimicrox
      bat
      blueman
      bluez
      bluez-tools
      btop
      cliphist
      delta
      direnv
      dnsutils
      eza
      file-roller
      fzf
      gamemode
      gawk
      gnupg
      grim
      kitty
      libarchive
      libsecret
      lmstudio
      nerd-fonts.hasklug
      nerd-fonts.jetbrains-mono
      nerd-fonts.victor-mono
      nil
      nixd
      nvtopPackages.amd
      oh-my-zsh
      orca-slicer
      p7zip
      pavucontrol
      protontricks
      protonup-rs
      pciutils
      slurp
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
      zoom-us
      zsh-powerlevel10k
    ];

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
