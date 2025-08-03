{
  ...
}:

{
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    settings = {
      input = {
        repeat_delay = 200;
        repeat_rate = 75;
      };
    };
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    extraConfig = ''
      monitor = desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513, preferred, auto, 1
      monitor = desc:Dell Inc. DELL U2720Q 685JV83, preferred, auto-up, 1
      monitor = desc:Dell Inc. DELL U2720Q D84V123, preferred, auto-right, 1, transform, 3
      monitor = , preferred, auto, 1
    '';
  };
}
