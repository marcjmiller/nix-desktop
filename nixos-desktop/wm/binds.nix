{ ... }:
let
  inherit (import ../variables.nix)
    launcher
    mod
    terminal
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Workspace navigation
      "${mod}, 1, workspace, 1"
      "${mod}, 2, workspace, 2"
      "${mod}, 3, workspace, 3"
      "${mod}, 4, workspace, gm"
      "${mod}, C, workspace, comm"
      "${mod}, D, workspace, dev"
      "${mod}, W, workspace, www"
      "${mod}, mouse_down, workspace, e-1"
      "${mod}, mouse_up, workspace, e+1"
      "${mod}, TAB, workspace, previous"

      # Window workspace movements
      "${mod} SHIFT, 1, movetoworkspacesilent, 1"
      "${mod} SHIFT, 2, movetoworkspacesilent, 2"
      "${mod} SHIFT, 3, movetoworkspacesilent, 3"
      "${mod} SHIFT, C, movetoworkspacesilent, name:comm"
      "${mod} SHIFT, D, movetoworkspacesilent, name:dev"
      "${mod} SHIFT, 4, movetoworkspacesilent, name:gm"
      "${mod} SHIFT, W, movetoworkspacesilent, name:www"

      # Window behavior
      "${mod}, F, togglefloating"
      "${mod}, G, togglegroup"
      "${mod}, Q, killactive"
      "${mod}, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
      "${mod}, W, exec, pkill -SIGUSR2 waybar"

      # App shortcuts
      "${mod}, Return, exec, ${terminal}"
      "${mod} SHIFT, Return, exec, ${launcher}"
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];
  };
}
