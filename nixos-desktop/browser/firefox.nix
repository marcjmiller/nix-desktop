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
        enhancer-for-youtube
        frankerfacez
        tampermonkey
        ublock-origin
      ];
    };
    # ---- POLICIES ----
    # Check about:policies#documentation for options.
    policies = {
      # SecurityDevices = {
      #   Add = {
      #     "Yubikey/Smartcard" = "${pkgs.opensc}/lib/opensc-pkcs11.so";
      #   };
      # };
      OfferToSaveLoginsDefault = false;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "never"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"

      # ---- PREFERENCES ----
      # Check about:config for options.
      # Preferences = {
      #   "browser.contentblocking.category" = {
      #     Value = "strict";
      #     Status = "locked";
      #   };
      #   "extensions.pocket.enabled" = lock-false;
      #   "extensions.screenshots.disabled" = lock-true;
      #   "browser.topsites.contile.enabled" = lock-false;
      #   "browser.formfill.enable" = lock-false;
      #   "browser.search.suggest.enabled" = lock-false;
      #   "browser.search.suggest.enabled.private" = lock-false;
      #   "browser.urlbar.suggest.searches" = lock-false;
      #   "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
      #   "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
      #   "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
      #   "browser.newtabpage.activity-stream.showSponsored" = lock-false;
      #   "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
      #   "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
    };
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
}
