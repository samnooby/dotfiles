{ ... }:

{
    system = "x86_64-linux";
    username = "sam";
    homeDirectory = "/home/sam";
    config = {
        theme = {
            wallpaper = ./wallpaper.png;
            name = "oceanicnext";
        };
        applications = {
            hyprland.enable = true;
            fish.enable = true;
            firefox.enable = true;
	          neovim.enable = true;
            git.enable = true;
            vscode.enable = true;
        };
    };
    nixos-config = {
      applications = {
        hyprland.enable = true;
        fish.enable = true;
      };
    };
}
