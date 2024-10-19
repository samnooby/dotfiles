{ ... }:

{
    system = "x86_64-linux";
    username = "sam";
    homeDirectory = "/home/sam";
    theme = {
      wallpaper = ./wallpaper.png;
        name = "oceanicnext";
    };
    config = {
        theme = theme;
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
      theme = theme;
      applications = {
        hyprland.enable = true;
        fish.enable = true;
      };
    };
}
