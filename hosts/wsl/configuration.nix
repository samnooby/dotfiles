{ config, lib, pkgs, home-manager, username, ... }:
with builtins;

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules
    ];

  wsl.enable = true;
  wsl.defaultUser = "${username}";

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.groups.owners.gid = 1001;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    uid = 1000;
    group = "owners";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  home-manager = {
    users.${username} = {
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";

      programs.home-manager.enable = true;

      home.stateVersion = "24.05";
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = [
   pkgs.gcc14
  ];
  
  system.stateVersion = "24.05"; # Did you read the comment?
}
