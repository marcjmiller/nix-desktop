{ config, pkgs, ... }:

{
  home.username = "marcm";
  home.homeDirectory = "/home/marcm";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    bat
    eza
    kitty
    zip
    xz
    unzip
    p7zip
    dnsutils
    tree
    gnupg
    gawk
    tealdeer
    btop
    pciutils
    usbutils
  ];

  programs.git = {
    enable = true;
    userName = "marcjmiller";
    userEmail = "marcjmiller@outlook.com";
  };
  
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 15d --keep 3";
    flake = "/home/marcm/nixcfg";
  };

  home.stateVersion = "25.05";
}

