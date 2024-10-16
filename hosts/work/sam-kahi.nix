{ config, pkgs, ... }:

{
    imports = [
        ../../home-manager
    ];

    config = {
        home.username = "sam";
        home.homeDirectory = "/Users/sam";

        modules = {
            hyprland.enable = false;
            neovim.enable = true;
            fish.enable = true;
            firefox.enable = true;
            git.enable = true;
            vscode.enable = true;  
        };
    };
}