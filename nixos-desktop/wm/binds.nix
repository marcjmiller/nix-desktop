{ ... }:
let
  inherit (import ../variables.nix)
    apps
    mod
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
      "${mod}, 6, workspace, 6"
      "${mod}, 7, workspace, 7"
      "${mod}, 8, workspace, 8"
      "${mod}, 9, workspace, 9"
      "${mod}, 0, workspace, 10"
      "${mod}, mouse_down, workspace, e-1"
      "${mod}, mouse_up, workspace, e+1"
      "${mod}, TAB, workspace, previous"

      # Window workspace movements
      "${mod} SHIFT, 1, movetoworkspacesilent, 1"
      "${mod} SHIFT, 2, movetoworkspacesilent, 2"
      "${mod} SHIFT, 3, movetoworkspacesilent, 3"
      "${mod} SHIFT, 4, movetoworkspacesilent, 4"
      "${mod} SHIFT, 5, movetoworkspacesilent, 5"
      "${mod} SHIFT, 6, movetoworkspacesilent, 6"

      # Window behavior
      "${mod}, F, togglefloating"
      "${mod}, G, togglegroup"
      "${mod}, Q, killactive"
      "${mod}, S, togglesplit"

      # App shortcuts
      "${mod}, Return, exec, ${apps.terminal}"
      "${mod} SHIFT, B, exec, ${apps.browser}"
      "${mod} SHIFT, F, exec, ${apps.file-manager}"
      "${mod} SHIFT, Return, exec, ${apps.launcher}"
      "${mod}, Z, exec, ${apps.gui-editor}"
      
      # Restart waybar
      "${mod}, W, exec, pkill -SIGUSR2 waybar"
      
      # Screenshots
      "${mod}, Print, exec, grim -g \"$(slurp)\" - | wl-copy"
      
      # Cut/Paste w/ history
      "${mod}, V, exec, ${apps.terminal} --class clipse -e \"clipse\""
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];
  };
}
