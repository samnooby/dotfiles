{ config, pkgs, lib, ... }:

let cfg = config.module.users; in {
  options.module.users.samn.enable = lib.mkEnableOption "Enable user Samn";

  config = lib.mkIf cfg.samn.enable {
    users.users.samn = {
      isNormalUser = true;
      description = "Sam Newby";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        google-chrome
	vscode
      ];
    };
  };
}
