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

      homeConfigurations = import ./home-configurations.nix {
        inherit inputs nixpkgs home-manager hostsDir;
      };
    in
    {
      inherit (homeConfigurations) homeConfigurations;
    };
}