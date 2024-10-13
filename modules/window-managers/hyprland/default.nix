{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.window-manager.hyprland;
in
{
  options.window-manager.hyprland.enable = lib.mkEnableOption "Enable hyprland window manager module";

  config = lib.mkIf cfg.enable {
    programs.kitty.enable = true;
    wayland.windowManager.hyprland.enable = true;

    # wayland.windowManager.hyprland.plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
    # ];

    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      
       bind =
        [
          # Quick Programs
          "$mod, F, exec, firefox"
          "$mod, Q, exec, $terminal"
          "$mod, C, killactive,"
          # Switch focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
