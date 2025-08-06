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

    packages = with pkgs; [
      bat
      bluez
      bluez-tools
      btop
      direnv
      dnsutils
      eza
      fzf
      gawk
      gnupg
      kitty
      libarchive
      nerd-fonts.hasklug
      nerd-fonts.jetbrains-mono
      nerd-fonts.victor-mono
      nil
      nixd
      oh-my-zsh
      p7zip
      protonup-rs
      pciutils
      tealdeer
      tree
      unzip
      usbutils
      vesktop
      xz
      zip
      zoom-us
      zsh-powerlevel10k
    ];

    file = {
      "Pictures/Wallpapers" = {
        source = ./nixos-desktop/files/wallpapers;
        recursive = true;
      };
    };

    stateVersion = "25.05";
  };

  programs.lutris = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
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
    image = ./nixos-desktop/files/wallpapers/${wallpaperImg};
    polarity = "dark";
    targets = {
      fuzzel.enable = true;
      kitty.enable = true;
      firefox.enable = true;
    };

    opacity = {
      desktop = 0.90;
      popups = 0.90;
      terminal = 0.90;
    };
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
}
