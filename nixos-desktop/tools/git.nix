{
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Marc Miller";
    userEmail = "marcjmiller@outlook.com";
    extraConfig = {
      commit.verbose = true;
      core.askPass = "";
      core.editor = "nvim";
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
      diff.histogram = "histogram";
      help.autocorrect = 10;
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.autosquash = true;
      rebase.autostash = true;
      rerere.enabled = true;
    };
  };
}
