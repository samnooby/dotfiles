{ ... }:

{
  imports = [
    ./shell/fish.nix
    ./neovim
    ./tmux.nix
    ./theme/stylix.nix
    ./git.nix
    ./alacritty.nix
    ./gnome.nix
  ];
}