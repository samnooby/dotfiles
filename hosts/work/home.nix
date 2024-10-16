{ inputs, nixpkgs, home-manager, ... }:

let 
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
in
{
    work = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
            ../../home-manager
            {
                home = {
                    username = "sam-kahi";
                    homeDirectory = "/Users/sam-kahi";
                    packages = [ pkgs.home-manager ];
                    stateVersion = "24.05";
                };
            }
        ];
    };
}