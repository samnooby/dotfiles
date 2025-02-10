{ lib, config, ... }:
with lib;

let cfg = config.tmux;
in {
  options.tmux = { enabled = mkOption { type = types.bool; }; };

  config = mkIf cfg.enabled { programs.tmux = { enable = true; }; };
}
