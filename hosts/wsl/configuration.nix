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

  services.dbus.enable = true;
  system.activationScripts.createDirectory = ''
    mkdir -p /run/user/1000/
    chown 1000:1001 /run/user/1000
    chmod 700 /run/user/1000
  '';

  systemd.user.services.dbus-session = {
    description = "D-Bus Session Bus for WSL";
    serviceConfig = {
      ExecStart = "${pkgs.dbus}/bin/dbus-daemon --session --address=unix:path=%t/bus --nofork --nopidfile --syslog-only";
      ExecStop = "${pkgs.dbus}/bin/dbus-send --session --type=method_call --dest=org.freedesktop.DBus / org.freedesktop.DBus.LeaveSession";
    };
    wantedBy = [ "default.target" ];
  };

  environment.variables = {
    XDG_RUNTIME_DIR = "/run/user/1000";
    DBUS_SESSION_BUS_ADDRESS = "unix:path=${toString (getEnv "XDG_RUNTIME_DIR")}/bus";
  };
  
  system.stateVersion = "24.05"; # Did you read the comment?
}
