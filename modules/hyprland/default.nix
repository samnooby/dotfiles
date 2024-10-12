{ lib, config, ... }:

let cfg = config.module.hyprland; in {
  options.module.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland Module";
  };

  config = lib.mkIf cfg.enable {
    # Enable hyprland display and disable xserver
    programs.hyprland.enable = true;
    services.xserver.enable = false;
  };
}
