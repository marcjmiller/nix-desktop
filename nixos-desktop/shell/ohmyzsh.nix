{ ... }:

{
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "alias-finder"
      "direnv"
      "docker"
      "docker-compose"
      "eza"
      "fzf"
      "gitfast"
      "kitty"
      "sudo"
      "tldr"
      "z"
    ];

  };
}
