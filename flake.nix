{
  description = "Home Manager configuration of Sam Newby";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs: {
    homeConfigurations.sam = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";

      modules = [ stylix.homeManagerModules.stylix ./hosts/wsl.nix ];
    };
    homeConfigurations.kahi = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";

      modules = [ stylix.homeManagerModules.stylix ./hosts/kahi.nix ];
    };
  };
}
