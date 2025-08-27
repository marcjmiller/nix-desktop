{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      copy_on_select = "clipboard";
      scrollback_lines = 10000;
    };
  };
}
