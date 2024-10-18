{ ... }:
{
    system = "aarch64-darwin";
    username = "sam";
    homeDirectory = "/Users/sam";
    config = {
        applications = {
            hyprland.enable = false;
            neovim.enable = true;
            fish.enable = true;
            firefox.enable = false;
        #     git.enable = false;
            vscode.enable = true;
        };
    };
}