{ lib, config, ... }:
with lib;

{
    options = {
        git.username = mkOption {
            type = types.str;
            description = "The username displayed in git commits";
        };
        git.email = mkOption {
            type = types.str;
            description = "The email displayed in git commits";
        };
    };

    config = {
        programs.git = {
            enable = true;
            aliases = {
                co = "checkout";
                ci = "commit";
                st = "status";
                br = "branch";
                rs = "reset";
            };
            userName = config.git.username;
            userEmail = config.git.email;
        };
        programs.lazygit = {
            enable = true;
        };
    };
}