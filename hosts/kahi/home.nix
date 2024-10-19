{ ... }:
rec {
    system = "aarch64-darwin";
    username = "sam";
    homeDirectory = "/Users/sam";
    theme = {
      wallpaper = ./wallpaper.png;
      name = "woodland";
    };
    config = {
        theme = theme; 
        applications = {
            hyprland.enable = false;
            neovim.enable = true;
            fish.enable = true;
            firefox.enable = false;
            git.enable = true;
            vscode.enable = true;
        };
    };
}
