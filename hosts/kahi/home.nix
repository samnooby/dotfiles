{ ... }:
{
    system = "aarch64-darwin";
    username = "sam";
    homeDirectory = "/Users/sam";
    config = {
        theme = {
            wallpaper = ./wallpaper.png;
            name = "deep-oceanic-next";
        };
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