{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    sam-home-manager.url = "../home-manager";
  };

  outputs = { self, nixpkgs, sam-home-manager, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        
        sam-home-manager.nixosModules.home-manager
      ];
    };
  };
}
