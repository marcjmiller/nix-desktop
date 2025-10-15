{
  # Location of the flake
  flakeDir = "$HOME/nixcfg";

  # Modifier key to use with Hyprland
  mod = "SUPER";
  
  # Monitors
  mainMonitor = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 22100B010513";
  rightMonitor = "desc:Dell Inc. DELL U2720Q D84V123";
  topMonitor = "desc:Dell Inc. DELL U2720Q 685JV83";

  # Some preferred apps
  apps = {
    browser = "firefox";
    editor = "nvim";
    file-manager = "thunar";
    gui-editor = "zeditor";
    launcher = "fuzzel";
    terminal = "kitty";
  };
  
  # Wallpaper selection
  wallpaperImg =
    {
      astronaut = "astronaut.jpg";
      blackhole_1 = "blackhole_1.png";
      nordlaunch = "nordlaunch.png";
      pac-man = "pac-man.png";
    }
    .astronaut;
    
    aiHome = "$HOME/workspace/ai";
}
