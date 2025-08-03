{ ... }:

{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      buffer_font_family = "Victor Mono Nerd Font";
      features = {
        copilot = false;
      };
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
        background_coloring = "indent_aware";
      };
      tab_size = 2;
      telemetry = {
        metrics = false;
      };
      terminal = {
        font_family = "Victor Mono Nerd Font";
      };
      theme = {
        mode = "dark";
      };
    };

    extensions = [
      "nix"
      "docker"
      "docker compose"
    ];
  };
}
