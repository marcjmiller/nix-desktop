{ ... }:

{
  programs.git = {
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
}
