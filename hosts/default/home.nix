{ ... }:
{
    system = "aarch64-darwin";
    username = "sam";
    homeDirectory = "/Users/sam";
    config = {
        applications = {
            hyprland.enable = true;
            neovim.enable = true;
            fish.enable = true;
            firefox.enable = false;
            git.enable = true;
            vscode.enable = true;
        };
    };
}
