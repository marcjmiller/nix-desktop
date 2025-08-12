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
          "custom/startmenu"
          "idle_inhibitor"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
          "group/tray"
          "clock"
          "custom/logout"
        ];

        "custom/startmenu" = {
          format = "";
          on-click = "fuzzel";
          tooltip = false;
        };
        
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
            "comm" = [ ];
            "dev" = [ ];
            "gm" = [ ];
            "www" = [ ];
          };
        };

        "tray" = {
          spacing = 12;
          icons = {
            Steam = "";
          };
        };

        "group/tray" = {
          drawer = {
            transition-duration = 500;
          };
          orientation = "horizontal";
          modules = [
            "bluetooth"
          ];
        };

        "bluetooth" = {
          format = "󰂲";
          format-on = "{icon}";
          format-off = "{icon}";
          format-connected = "{icon}";
          format-icons = {
            on = "󰂯";
            off = "󰂲";
            connected = "󰂱";
          };
          on-click = "blueman-manager";
          tooltip-format-connected = "{device_enumerate}";
        };

        "network" = {
          interface = "eno1";
          format-wifi = "";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          format-ethernet = "󰲝";
          tooltip-format-ethernet = "󰲝 {ifname} {ipaddr}";
          format-linked = "󱚵";
          tooltip-format-linked = "󰲜 {ifname} (No IP)";
          format-disconnected = "󰤫";
          tooltip-format-disconnected = "Disconnected ⚠ {ifname}";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
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
        
        "custom/logout" = {
          format = "";
          on-click = "sleep 3 && hyprctl dispatch exit";
          tooltip = false;
        };
      };
    };
  };
}
