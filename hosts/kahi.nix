{ pkgs, ... }:

{
  imports = [ ../modules ];

  home.username = "samnewby";
  home.homeDirectory = "/Users/samnewby";

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
  alacritty = {
    enabled = true;
    setShell = false;
  };
  git = {
    username = "samnewby";
    email = "newbysam189@gmail.com";
  };
  lazygit.enabled = true;
}
