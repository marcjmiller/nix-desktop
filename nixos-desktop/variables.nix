{
  # Location of the flake
  flakeDir = "$HOME/nixcfg";

  # Modifier key to use with Hyprland
  mod = "SUPER";

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
