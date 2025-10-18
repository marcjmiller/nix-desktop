{ ... }:
let
  inherit (import ../variables.nix)
    apps
    hyprland
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Workspace navigation
      "${hyprland.mod}, 1, workspace, 1"
      "${hyprland.mod}, 2, workspace, 2"
      "${hyprland.mod}, 3, workspace, 3"
      "${hyprland.mod}, 4, workspace, 4"
      "${hyprland.mod}, 5, workspace, 5"
      "${hyprland.mod}, 6, workspace, 6"
      "${hyprland.mod}, 7, workspace, 7"
      "${hyprland.mod}, 8, workspace, 8"
      "${hyprland.mod}, 9, workspace, 9"
      "${hyprland.mod}, 0, workspace, 10"
      "${hyprland.mod}, mouse_down, workspace, e-1"
      "${hyprland.mod}, mouse_up, workspace, e+1"
      "${hyprland.mod}, TAB, workspace, previous"

      # Window workspace movements
      "${hyprland.mod} SHIFT, 1, movetoworkspacesilent, 1"
      "${hyprland.mod} SHIFT, 2, movetoworkspacesilent, 2"
      "${hyprland.mod} SHIFT, 3, movetoworkspacesilent, 3"
      "${hyprland.mod} SHIFT, 4, movetoworkspacesilent, 4"
      "${hyprland.mod} SHIFT, 5, movetoworkspacesilent, 5"
      "${hyprland.mod} SHIFT, 6, movetoworkspacesilent, 6"

      # Window behavior
      "${hyprland.mod}, F, togglefloating"
      "${hyprland.mod}, G, togglegroup"
      "${hyprland.mod}, Q, killactive"
      "${hyprland.mod}, S, togglesplit"
      "${hyprland.mod}, U, moveoutofgroup"

      # App shortcuts
      "${hyprland.mod}, Return, exec, ${apps.terminal}"
      "${hyprland.mod} SHIFT, B, exec, ${apps.browser}"
      "${hyprland.mod} SHIFT, F, exec, ${apps.file-manager}"
      "${hyprland.mod} SHIFT, Return, exec, ${apps.launcher}"
      "${hyprland.mod} SHIFT, Z, exec, ${apps.gui-editor}"
      
      # Restart waybar
      "${hyprland.mod} SHIFT, W, exec, pkill -SIGUSR2 waybar"
      
      # Screenshots
      "${hyprland.mod}, Print, exec, grim -g \"$(slurp)\" - | wl-copy"
      
      # Cut/Paste w/ history
      "${hyprland.mod} SHIFT, V, exec, ${apps.terminal} --class clipse -e \"clipse\""
      
      # Pypr commands
      "${hyprland.mod}, B, exec, pypr expose" # Expose view
      "${hyprland.mod}  , V, exec, pypr toggle volume" # Toggle terminal
      "${hyprland.mod} SHIFT, W, exec, pypr fetch_client_menu" # Find lost windows
      "${hyprland.mod}, escape, exec, pypr toggle term" # Toggle terminal
    ];

    bindm = [
      "${hyprland.mod}, mouse:272, movewindow"
      "${hyprland.mod}, mouse:273, resizewindow"
    ];
  };
}
