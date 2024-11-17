{ pkgs, username, config, lib, ... }:
with builtins;

{
  services.dbus.enable = true;
  system.activationScripts.createDirectory = ''
    mkdir -p /run/user/1000/
    chown 1000:1001 /run/user/1000
    chmod 700 /run/user/1000
  '';

  # systemd.user.services.dbus-session = {
  #  description = "D-Bus Session Bus for WSL";
  #  serviceConfig = {
  #    ExecStart = "${pkgs.dbus}/bin/dbus-daemon --session --address=unix:path=%t/bus --nofork --nopidfile --syslog-only";
  #    ExecStop = "${pkgs.dbus}/bin/dbus-send --session --type=method_call --dest=org.freedesktop.DBus / org.freedesktop.DBus.LeaveSession";
  #  };
  #  wantedBy = [ "default.target" ];
  #};

  environment.variables = {
    XDG_RUNTIME_DIR = "/run/user/1000";
    DBUS_SESSION_BUS_ADDRESS = "unix:path=${toString (getEnv "XDG_RUNTIME_DIR")}/bus";
  };

  programs.sway.enable = true;

  home-manager.users.${username} = { lib, config, ... }: {
    # home.sessionVariables = {
    #   XDG_RUNTIME_DIR = "${config.home.homeDirectory}/.run";
    # };
    
    home.activation = {
     startDbus = lib.hm.dag.entryAfter ["sessionVariables"] ''
        eval $(dbus-launch)
     '';
    };
  };
}
