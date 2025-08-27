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
      branch.sort = "-committerdate";
      commit.verbose = true;
      core.askPass = "";
      core.editor = "nvim";
      core.pager = "delta";
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
      diff.algorithm = "histogram";
      diff.histogram = "histogram";
      fetch.all = true;
      fetch.prune = true;
      fetch.pruneTags = true;
      help.autocorrect = 10;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rebase.autosquash = true;
      rebase.autostash = true;
      rebase.updateRefs = true;
      rerere.autoupdate = true;
      rerere.enabled = true;
      tag.sort = "version:refname";
    };
  };
}
