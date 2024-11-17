{ ... }:

{
  imports = [
    ./shell/fish.nix
    ./neovim
    ./tmux.nix
    ./theme/stylix.nix
    ./git.nix
    ./kitty.nix
    ./wayland.nix
  ];
}
