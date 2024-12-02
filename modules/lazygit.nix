{ lib, config, ... }:
with lib;

let cfg = config.lazygit;
in {
  options.lazygit = {
    enabled = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enabled { programs.lazygit = { enable = true; }; };
}
