{
  description = "Sam's NixOS Build";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: 
  let
    username = "sam";
  in
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
	inputs = inputs;
	home-manager = home-manager;
	username = username;
      };
      modules = [ 
        ./configuration.nix 
        stylix.nixosModules.stylix
     ];
    };
  };
}
