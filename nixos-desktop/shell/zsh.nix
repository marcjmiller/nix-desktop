{
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    history = {
      append = true;
      ignoreAllDups = true;
      saveNoDups = true;
    };
    historySubstringSearch.enable = true;
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ../files/shell;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];
    sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "vim";
    };
    syntaxHighlighting.enable = true;
  };
}
