{ hostsDir, inputs, nixpkgs, home-manager, ... }:
with builtins;

let
    # Get the existing home config paths
    hostHomeConfigPaths = mapAttrs (name: value: "${toString hostsDir}/${name}/home.nix") (readDir hostsDir);
    hostsWithoutHomeConfig = filter (name: !pathExists (getAttr name hostHomeConfigPaths)) (attrNames hostHomeConfigPaths);
    filteredHomeConfigPaths = removeAttrs hostHomeConfigPaths hostsWithoutHomeConfig;
    # Import each of the home configurations
    homeSetupSettings = mapAttrs (name: value: import value {}) filteredHomeConfigPaths;
    homeConfigurations = mapAttrs (name: setup: let 
        pkgs = inputs.nixpkgs.legacyPackages.${setup.system};
    in home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
            ./home-manager
            {
                config = setup.config;
            }
            {
                home = {
                    username = setup.username;
                    homeDirectory = setup.homeDirectory;
                    packages = [ pkgs.home-manager ];
                    stateVersion = "24.05";
                };
            }
        ];
    }) homeSetupSettings;
in {
    inherit homeConfigurations;
}
