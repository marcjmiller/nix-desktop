{
  inputs,
  pkgs,
  ...
}:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Marc Miller";
      isDefault = true;
      extensions.packages = with firefox-addons; [
        bitwarden
        darkreader
        ublock-origin
        # better_youtube
        # betterttv
        # tampermonkey
      ];
      # search = {
      #   force = true;
      #   default = "google";
      #   order = [ "google" ];
      #   engines = {
      #     "Nix Packages" = {
      #       urls = [
      #         {
      #           template = "https://search.nixos.org/packages";
      #           params = [
      #             {
      #               name = "type";
      #               value = "packages";
      #             }
      #             {
      #               name = "query";
      #               value = "{searchTerms}";
      #             }
      #           ];
      #         }
      #       ];
      #       icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      #       definedAliases = [ "@np" ];
      #     };
      #   };
      # };
    };
  };
}
