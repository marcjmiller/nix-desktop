{
  # Location of the flake
  flakeDir = "$HOME/nixcfg";

  # Modifier key to use with Hyprland
  mod = "SUPER";

  # Some preferred apps
  launcher = "fuzzel";
  terminal = "kitty";

  # Wallpaper selection
  wallpaperImg =
    {
      pac-man = "pac-man.png";
      blackhole_1 = "blackhole_1.png";
      nordlaunch = "nordlaunch.png";
    }
    .nordlaunch;
}
