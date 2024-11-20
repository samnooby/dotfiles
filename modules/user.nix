{ config, lib, pkgs, home-manager, ... }:
with lib;

let
    cfg = config.user;
in
{
    options.user = {
        name = mkOption {
            type = types.str;
            example = "Sam";
            description = "The name of the default user";
        };
        homeDirectory = {
            type = types.str;
            default = "/home/${cfg.name}";
            example = "/home/sam";
            description = "The home directory of the default user";
        };
    }

    config = let
        username = cfg.name;
    in
    {
        networking.hostName = username;

        # Create the default group and user
        users.groups.owners.gid = 1001;
        users.users.${username} = {
            isNormalUser = true;
            uid = 1000;
            group = "owners";
            extraGroups = [ "wheel" "networkmanager" ];
        };

        # Set up home-manager user
        home-manager.users.${username} = config.home // {
            home.username = username;
            home.homeDirectory = "/home/${username}";

            programs.home-manager.enable = true;

            home.stateVersion = "24.05";
        };
    };
}