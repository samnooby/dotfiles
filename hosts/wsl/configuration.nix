{ config, lib, pkgs, home-manager, ... }:
with builtins;

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  user.username = "sam";
  user.homeDirectory = "/home/sam";

  wsl.enable = true;
  wsl.defaultUser = "sam";

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
