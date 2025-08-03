{
  pkgs,
  ...
}:

{
  imports = [
    ./nixos-desktop/shell
    ./nixos-desktop/wm
    ./nixos-desktop/editor
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

  programs = {
    git = {
      enable = true;
      userName = "Marc Miller";
      userEmail = "marcjmiller@outlook.com";
      extraConfig = {
        core.askPass = "";
        core.editor = "vim";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
        rebase.autosquash = true;
        rebase.autostash = true;
        commit.verbose = true;
        rerere.enabled = true;
        help.autocorrect = 10;
        diff.histogram = "histogram";
      };
    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 15d --keep 3";
      flake = "/home/marcm/nixcfg";
    };
  };

}
