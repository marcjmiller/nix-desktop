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
  home.sessionVariables.NIXOS_OZONE_WL = "1";
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
        # Comm apps to comm workspace
        "workspace name:comm, class:(?i)^discord$"
        "workspace name:dev, class:(?i)^dev\.zed\.zed$"
      ];
      exec-once = [
        "blueman-applet"
        "nm-applet --indicator"
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
