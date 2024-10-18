{ ... }:
{
    system = "x86_64-linux";
    username = "sam";
    homeDirectory = "/home/sam";
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
