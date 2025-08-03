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
      "git"
      "gitfast"
      "httpie"
      "kitty"
      "sudo"
      "tldr"
      "z"
    ];
  };
}
