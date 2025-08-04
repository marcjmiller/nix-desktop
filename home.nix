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
      btop
      direnv
      dnsutils
      eza
      # firefox
      fzf
      gawk
      gnupg
      kitty
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
      xz
      zip
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

  stylix = {
    image = ./files/wallpapers/${wallpaperImg};
    targets = {
      fuzzel.enable = true;
      kitty.enable = true;
      firefox.enable = true;
    };
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
}
