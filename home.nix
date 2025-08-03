{
  pkgs,
  ...
}:

{
  imports = [
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
      pciutils
      tealdeer
      tree
      unzip
      usbutils
      xz
      zip
      zsh-powerlevel10k
    ];

    stateVersion = "25.05";
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
}
