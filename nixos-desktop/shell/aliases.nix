{ ... }:
let
  inherit (import ../variables.nix)
    flakeDir
    ;
in
{
  programs.zsh.shellAliases = {
    clean = "nh clean all";
    rb = "nh os switch ${flakeDir}";
    upd = "nh os switch --update ${flakeDir}";
    zed = "zeditor";
  };
}
