{
  pkgs,
  ...
}:

{
  imports = [
    ./nixos-desktop/shell
  ];

  home = {
    username = "marcm";
    homeDirectory = "/home/marcm";

    packages = with pkgs; [
      bat
      btop
      dnsutils
      eza
      kitty
      gawk
      gnupg
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
    ];

    stateVersion = "25.05";
  };

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  programs = {
    git = {
      enable = true;
      userName = "marcjmiller";
      userEmail = "marcjmiller@outlook.com";
    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 15d --keep 3";
      flake = "/home/marcm/nixcfg";
    };

    zed-editor = {
      enable = true;
      userSettings = {
        indent_guides = {
          enabled = true;
          coloring = "indent_aware";
          background_coloring = "indent_aware";
        };
        tab_size = 2;
        theme = {
          mode = "dark";
        };
      };

      extensions = [
        "nix"
        "docker"
        "docker compose"
      ];
    };
  };

}
