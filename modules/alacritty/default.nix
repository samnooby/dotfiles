{ lib, config, pkgs, ... }:
with lib;
with builtins;

let colors = config.lib.stylix.colors.withHashtag;
in {
  options.alacritty.enabled = mkOption {
    type = types.bool;
    default = false;
  };

  config = mkIf config.alacritty.enabled {
    home.file."./.config/alacritty/alacritty.toml" = {
      text = with config.stylix.fonts;
        with colors; ''
          [colors.bright]
          black = "${base03}"
          blue = "${bright-blue}"
          cyan = "${bright-cyan}"
          green = "${bright-green}"
          magenta = "${bright-magenta}"
          red = "${bright-red}"
          white = "${base07}"
          yellow = "${yellow}"

          [colors.cursor]
          cursor = "${base05}"
          text = "${base00}"

          [colors.normal]
          black = "${base00}"
          blue = "${blue}"
          cyan = "${cyan}"
          green = "${green}"
          magenta = "${magenta}"
          red = "${red}"
          white = "${base05}"
          yellow = "${yellow}"

          [colors.primary]
          background = "${base00}"
          bright_foreground = "${base07}"
          foreground = "${base05}"

          [colors.selection]
          background = "${base02}"
          text = "${base05}"

          [font]
          size = ${toString sizes.terminal}
          [font.normal]
          family = "${monospace.name}"
          style = "Regular"

          [window]
          dynamic_padding = true
          decorations = "None"
          opacity = 0.9
          startup_mode = "Maximized"
        '';
    };
    # programs.alacritty.settings = {
    #   font = with config.stylix.fonts; {
    #     normal = {
    #       family = monospace.name;
    #       style = "Regular";
    #     };
    #     size = sizes.terminal;
    #   };
    #   window.opacity = with config.stylix.opacity; terminal;
    #   colors = with colors; {
    #     primary = {
    #       foreground = base05;
    #       background = base00;
    #       bright_foreground = base07;
    #     };
    #     selection = {
    #       text = base05;
    #       background = base02;
    #     };
    #     cursor = {
    #       text = base00;
    #       cursor = base05;
    #     };
    #     normal = {
    #       black = base00;
    #       white = base05;
    #       inherit red green yellow blue magenta cyan;
    #     };
    #     bright = {
    #       black = base03;
    #       white = base07;
    #       red = bright-red;
    #       green = bright-green;
    #       inherit yellow;
    #       blue = bright-blue;
    #       magenta = bright-magenta;
    #       cyan = bright-cyan;
    #     };
    #   };
    # };
  };
}
