{ ... }:
let
  inherit (import ../variables.nix)
    wallpaperImg
    ;
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/Pictures/Wallpapers/${wallpaperImg}";
      wallpaper = ",~/Pictures/Wallpapers/${wallpaperImg}";
    };
  };
}
