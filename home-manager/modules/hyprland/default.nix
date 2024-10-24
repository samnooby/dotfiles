{ lib, config, inputs, pkgs, ... }:

let
  cfg = config.applications.hyprland;
in
{
  options.applications.hyprland.enable = lib.mkEnableOption "Enable hyprland window manager module";

  config = lib.mkIf cfg.enable {
    programs.kitty.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      ];

      settings = {
        "$mod" = "SUPER";
        "$terminal" = "kitty";
        
        monitor = [
          "eDP-1, 1920x1080, 0x0, 1"
          "HDMI-A-1, 1920x1080, -1920x0, 1"
        ];
        
        plugin = {
          hyprbars = {
            bar_height = 20;
          };
        };

        bindel = [
         # Laptop multimedia keys for volume and LCD brightness
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, light -A 30"
          ",XF86MonBrightnessDown, exec, light -U 30"
        ];
  
        bind =
          [
            # Quick Programs
            "$mod, F, exec, firefox"
            "$mod, I, exec, google-chrome-stable" 
            "$mod, Q, exec, $terminal"
            "$mod, C, killactive,"
            # Switch focus
            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"
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
        
        gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 3;
            workspace_swipe_min_fingers = true;
            workspace_swipe_distance = 500;
            workspace_swipe_cancel_ratio = 0.6;
        };

        decoration = {
            rounding = 5;
            inactive_opacity = 0.90;
        };

        input = {
            sensitivity = 0.6;
            accel_profile = "adaptive";
            touchpad = {
                tap-and-drag = true;
                drag_lock = true;
            };
        };

        general = {
            border_size = 2;
            resize_on_border = true;
            layout = "master";
            gaps_out = 12;
            gaps_in = 6;
        };
      };
    };
  };
}
