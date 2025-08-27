{ ... }:
let
  inherit (import ../variables.nix)
    aiHome
    flakeDir
    ;
in
{
  programs.zsh.shellAliases = {
    rb = "nh os switch ${flakeDir} -- --impure";
    rbc = "nh clean all --keep 10";
    rbcd = "nh clean all --keep 10 --dry";
    vi = "nvim";
    vim = "nvim";
    upd = "nh os switch --update ${flakeDir}";
    zed = "zeditor";
    drun = "docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --shm-size 8G -v ${aiHome}/docker:/dockerx -w /dockerx";
  };
}
