{ ... }:
let
  inherit (import ../variables.nix)
    flakeDir
    ;
in
{
  programs.zsh.shellAliases = {
    rb = "NIXPKGS_ALLOW_INSECURE=1 NIXPKGS_ALLOW_UNFREE=1 nh os switch ${flakeDir} -- --impure";
    rbc = "nh clean all --keep 10";
    rbcd = "nh clean all --keep 10 --dry";
    vi = "nvim";
    vim = "nvim";
    upd = "nh os switch --update ${flakeDir}";
    zed = "zeditor";
  };
}
