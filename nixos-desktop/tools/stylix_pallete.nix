{
  lib,
  stylixColors,
  ...
}:
let
  isHexColor = val: lib.isString val && (lib.match "^[0-9a-f]{6}$" val != null);
  isBaseColor = name: (lib.match "^(base[0-9A-F]{2}|bright-[a-z]+|[a-z]+)$" name != null);
  flatColors = lib.filterAttrs (name: val: isHexColor val && isBaseColor name) stylixColors;
  lines = lib.concatStringsSep "\n" (
    map (name: "${name} ${flatColors.${name}}") (lib.attrNames flatColors)
  );
in
{
  home.file.".config/stylix-colors.txt".text = lines;
  home.file."preview-palette.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env sh

      while read -r name hex; do
        # Convert hex to R G B decimal values
        r=$((16#$(echo "$hex" | cut -c1-2)))
        g=$((16#$(echo "$hex" | cut -c3-4)))
        b=$((16#$(echo "$hex" | cut -c5-6)))
        
        brightness=$(( (r * 299 + g * 587 + b * 114) / 1000 ))
        
        if [ "$brightness" -gt 127 ]; then
          text_color=30   # black
        else
          text_color=97   # white
        fi

        # Print color block with name and hex
        printf "\e[48;2;%d;%d;%dm\e[%dm  %s: #%s  \e[0m\n" "$r" "$g" "$b" "$text_color" "$name" "$hex"
      done < ~/.config/stylix-colors.txt
    '';
  };
}
