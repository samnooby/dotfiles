{
    description = "Sam Newby's Nix Configuration";
    
    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland = {
        url = "github:hyprwm/Hyprland?tag=v0.44.0";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland-plugins = {
        url = "github:hyprwm/hyprland-plugins?tag=v0.44.0";
        inputs.hyprland.follows = "hyprland";
      };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      hostsDir = ./hosts;
      # Thank you https://stackoverflow.com/a/77737026
      allowed-unfree-packages = [
        "vscode"
      ];

      homeConfigurations = import ./home-configurations.nix {
        inherit inputs nixpkgs home-manager hostsDir allowed-unfree-packages;
      };

      nixosConfigurations = import ./nixos-configurations.nix {
        inherit hostsDir inputs nixpkgs home-manager allowed-unfree-packages;
      };
    in
    {
      inherit (homeConfigurations) homeConfigurations;
      inherit (nixosConfigurations) nixosConfigurations;
    };
}
