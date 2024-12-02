{ lib, config, ... }:
with lib;

let cfg = config.git;
in {
  options.git = {
    username = mkOption {
      type = types.str;
      default = "sam";
    };
    email = mkOption {
      type = types.string;
      default = "samjnewby@hotmail.com";
    };
  };

  config = {
    programs.git = {
      enable = true;
      userEmail = cfg.email;
      userName = cfg.username;
      extraConfig = { push = { autoSetupRemote = true; }; };
      aliases = {
        co = "checkout";
        s = "status";
        c = "commit -m";
        ca = "commit -am";
      };
    };
  };
}
