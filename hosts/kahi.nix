{ pkgs, ... }:

{
  imports = [ ../modules ];

  home.username = "sam";
  home.homeDirectory = "/Users/sam";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  neovim.enabled = true;
  stylix.enabled = true;
  fish = {
    enabled = true;
    defaultShell = true;
  };
  alacritty.enabled = true;
  git = {
    username = "Sam";
    email = "sam@kahi.io";
  };
  lazygit.enabled = true;
}
