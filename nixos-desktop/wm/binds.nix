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
      "${mod}, 4, workspace, 4"
      "${mod}, 5, workspace, 5"
      "${mod}, C, workspace, comm"
      "${mod}, D, workspace, dev"
      "${mod}, mouse_down, workspace, e-1"
      "${mod}, mouse_up, workspace, e+1"
      "${mod}, TAB, workspace, previous"
      "${mod} SHIFT, TAB, workspace, next"

      # Window workspace movements
      "${mod} SHIFT, C, movetoworkspacesilent, name:comm"
      "${mod} SHIFT, D, movetoworkspacesilent, name:dev"
      "${mod} SHIFT, 1, movetoworkspacesilent, 1"
      "${mod} SHIFT, 2, movetoworkspacesilent, 2"
      "${mod} SHIFT, 3, movetoworkspacesilent, 3"
      "${mod} SHIFT, 4, movetoworkspacesilent, 4"
      "${mod} SHIFT, 5, movetoworkspacesilent, 5"

      # Window behavior
      "${mod}, G, togglegroup"
      "${mod}, F, togglefloating"
      "${mod}, Q, killactive"

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
