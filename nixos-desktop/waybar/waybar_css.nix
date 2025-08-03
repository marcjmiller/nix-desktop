{
  lib,
  pkgs,
  stylixColors,
  ...
}:
let
  inherit (stylixColors) base00 base05;
  cssFile = pkgs.writeText "waybar.css" ''
    * {
      font-family: "JetBrainsMono Nerd Font Mono";
      font-size: 24px;
      min-height: 40px;
    }

    window#waybar {
      background: rgba(0,0,0,0);
    }

    #idle_inhibitor, #clock {
      min-height: 32px;
      min-width: 32px;
      border-radius: 16px;
      font-size: 24px;
      margin: 4px;
      padding: 0 8px;
      background-color: #${base00};
      color: #${base05};
    }
  '';
in
{
  programs.waybar.style = lib.mkForce cssFile;
}
