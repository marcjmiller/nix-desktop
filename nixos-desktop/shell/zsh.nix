{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion = {
      enable = true;
    };
    history = {
      append = true;
      ignoreAllDups = true;
      saveNoDups = true;
    };
    historySubstringSearch.enable = true;
    sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "vim";
    };
  };

  home.shell.enableZshIntegration = true;
}
