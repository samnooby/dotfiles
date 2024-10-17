{ hostsDir, inputs, nixpkgs, home-manager, ... }:
with builtins;

let
    # Get the existing home config paths
    hostHomeConfigPaths = mapAttrs (name: value: "${toString hostsDir}/${name}/home.nix") (readDir hostsDir);
    hostsWithoutHomeConfig = filter (name: !pathExists (getAttr name hostHomeConfigPaths)) (attrNames hostHomeConfigPaths);
    filteredHomeConfigPaths = removeAttrs hostHomeConfigPaths hostsWithoutHomeConfig;
    # Import each of the home configurations
    homeSetupSettings = mapAttrs (name: value: import value {}) filteredHomeConfigPaths;
    homeConfigurations = mapAttrs (name: setup: home-manager.lib.homeManagerConfiguration {
        inherit (nixpkgs.legacyPackages.${setup.system}) pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
            {
                inherit (setup.config) config;
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
