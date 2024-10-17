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
        pkgs = inputs.nixpkgs.legacyPackages."aarch64-darwin";
    in home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
            # ./home.nix
            # {
                # config = setup.config;
            # }
            {
                home = {
                    username = "sam";
                    homeDirectory = "/Users/sam";
                };
            }
        ];
    }) homeSetupSettings;
in {
    homeSetupSettingsDebug = builtins.trace "homeSetupSettings" homeSetupSettings;
    homeConfigurationsDebug = builtins.trace "homeConfigurations" homeConfigurations;

    inherit homeConfigurations;
}
