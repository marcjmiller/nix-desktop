{
  lib,
  stylixColors,
  ...
}:
let
  inherit (stylixColors)
    base00
    base08
    ;
in
{
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
    NIXPKGS_ALLOW_INSECURE = 1;
    NIXOS_OZONE_WL = "1";
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
        # Stick some apps to workspace, pin all workspaces to specific monitors
        "workspace name:1, class:'' monitor: desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513"
        "workspace name:2, class:'' monitor: desc:Dell Inc. DELL U2720Q D84V123"
        "workspace name:3, class:(?i)^(steam|lutris)$ monitor: desc:Dell Inc. DELL U2720Q 685JV83"
        "workspace name:comm, class:(?i)^(discord|vesktop)$ monitor: desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513"
        "workspace name:dev, class:(?i)^dev\.zed\.zed$ monitor: desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513"
        "workspace name:gm, class:'' monitor: desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513"
        "workspace name:www, class:(?i)^(firefox|chrome|brave)$ monitor: desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513"
      ];
      exec-once = [
        "nm-applet"
        "[workspace comm silent] vesktop"
        "[workspace gm silent] lutris"
        "[workspace gm silent] steam"
      ];
    };
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    extraConfig = ''
      monitor = desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513, preferred, 0x0, 1
      monitor = desc:Dell Inc. DELL U2720Q 685JV83, preferred, 0x-2160, 1
      monitor = desc:Dell Inc. DELL U2720Q D84V123, preferred, 3840x-1680, 1, transform, 3
    '';
  };
}
