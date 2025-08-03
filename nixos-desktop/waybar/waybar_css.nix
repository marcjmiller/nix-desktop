{
  lib,
  pkgs,
  stylixColors,
  ...
}:
let
  inherit (stylixColors)
    base00
    base01
    base05
    base08
    base0D
    ;
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

    #workspaces {
      color: #${base00};
      background: #${base01};
      border-radius: 16px;
    }

    #workspaces button {
      color: #${base00};
      background: #${base05};
      opacity: 0.5;
      margin: 3px;
      border-radius: 16px;
    }

    #workspaces button.active {
      color: #${base00};
      background: linear-gradient(45deg, #${base08}, #${base0D});
      opacity: 1.0;
      font-weight: bold;
    }
  '';
in
{
  programs.waybar.style = lib.mkForce cssFile;
}
