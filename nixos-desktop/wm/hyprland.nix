{
  lib,
  stylixColors,
  ...
}:
let
  inherit (import ../variables.nix)
    apps
    mainMonitor
    rightMonitor
    topMonitor
    ;
  inherit (stylixColors)
    base00
    base08
    ;
in
{
  home.sessionVariables = {
    EDITOR = "${apps.editor}";
    NIXOS_OZONE_WL = "1";
    NIXPKGS_ALLOW_INSECURE = 1;
    NIXPKGS_ALLOW_UNFREE = 1;
    TERMINAL = "${apps.terminal}";
  };

  services.mako = {
    enable = true;
    settings = {
      "default-timeout" = 5000;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    settings = {
      decoration = {
        rounding = 6;
        blur = {
          enabled = true;
          new_optimizations = true;
          popups = true;
          xray = true;
        };
      };
      
      general = {
        resize_on_border = true;
      };
      
      group = {
        groupbar = lib.mkForce {
          font_family = "JetBrainsMono Nert Font Mono";
          font_size = "12";
          font_weight_active = "Bold";
          font_weight_inactive = "Normal";
          height = "16";
          indicator_height = "0";
          text_color = "rgba(${base08}ee)";
          "col.active" = "rgba(${base00}dd)";
          "col.inactive" = "rgba(${base00}55)";
          "col.locked_active" = "rgba(${base00}dd)";
          "col.locked_inactive" = "rgba(${base00}55)";
        };
      };
      
      input = {
        repeat_delay = 200;
        repeat_rate = 75;
      };
      
      layerrule = [
        "blur, waybar"
        "blur, launcher"
        "blur, group"
        "ignorealpha 0.5, launcher"
      ];
      
      windowrulev2 = [
        # Chat
        "workspace 6, class:^(?i)discord$"
        "workspace 6, class:^(?i)vesktop$"

        # Dev
        "workspace 4, class:^(?i)code$"
        "workspace 4, class:^(?i)dev\.zed\.zed$"
        
        # Gaming
        "workspace 2, class:^(?i)steam$"
        "workspace 2, class:^(?i)lutris$"
        
        # Clipse
        "float,class:(clipse)"
        "size 800 500, class:(clipse)"
      ];

      exec-once = [
        "nm-applet"
        "clipse --listen-shell"
        "pypr --debug /tmp/pypr.log"
        "[workspace 6 silent] vesktop"
        "[workspace 2 silent] lutris"
        "[workspace 2 silent] steam"
      ];
    };
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    extraConfig = ''
      monitor=${mainMonitor}, 3840x2160@144, 0x0, 1
      monitor=${topMonitor}, preferred, 0x-2160, 1
      monitor=${rightMonitor}, preferred, 3840x-1680, 1, transform, 3

      workspace=1, monitor:${mainMonitor}, persistent:true, default:true
      workspace=2, monitor:${topMonitor}, persistent:true, default:true
      workspace=3, monitor:${rightMonitor}, persistent:true, default:true
      workspace=4, monitor:${mainMonitor}, persistent:true
      workspace=5, monitor:${mainMonitor}, persistent:true
      workspace=6, monitor:${rightMonitor}, persistent:true
      
      workspace=special:exposed,gapsout:60,gapsin:30,bordersize:5,border:true,shadow:false
    '';
  };
}
