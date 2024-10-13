{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.window-manager.hyprland;
in
{
  options.window-manager.hyprland.enable = lib.mkEnableOption "Enable hyprland window manager module";

  config = lib.mkIf cfg.enable {
    programs.kitty.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
        # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
        # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      ];

      settings = {
        "$mod" = "SUPER";
        bind = [ 
          "$mod, F, exec, firefox" 
        ]
        ++ (
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
  };
}
