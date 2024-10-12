{
  description = "Sam Newbys personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
  };

  outputs = { nixpkgs, ... } @ inputs: 
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}
