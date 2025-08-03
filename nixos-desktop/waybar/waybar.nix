{
  stylixColors,
  ...
}:
let
  inherit (stylixColors)
    base08
    ;
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [
          "idle_inhibitor"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
          "clock"
        ];

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = "true";
        };

        "hyprland/workspaces" = {
          show-special = true;
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "comm" = [ ];
            "code" = [ ];
          };
        };

        "tray" = {
          spacing = 12;
        };

        "clock" = {
          format = " {:L%I:%M %p %Z}";
          timezones = [
            "America/New_York"
            "Etc/UTC"
          ];
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            on-scroll = 1;
            format = {
              today = "<span color='#${base08}'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "tz_up";
          };
        };
      };
    };
    # style = lib.mkAfter (builtins.readFile ./waybar.css);
  };
}
