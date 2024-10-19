{ hostsDir, inputs, nixpkgs, home-manager, allowed-unfree-packages, stylix, ... }:
with builtins;

let
    hostsDirContent = attrNames (readDir hostsDir);
    hosts = filter (hostName :
        pathExists "${toString hostsDir}/${hostName}/hardware-configuration.nix" &&
        pathExists "${toString hostsDir}/${hostName}/home.nix"
    ) hostsDirContent;
    hostsSet = listToAttrs (map (host: { 
      name = "${host}"; 
      value = { home-path = "${toString hostsDir}/${host}/home.nix"; hardware-path = "${toString hostsDir}/${host}/hardware-configuration.nix"; }; 
    }) hosts);
    nixosConfigurations = mapAttrs (name: value: let 
        setup = import "${value.home-path}" {};
    in nixpkgs.lib.nixosSystem {
        system = setup.system;
        specialArgs = { inherit inputs allowed-unfree-packages; };


        modules = [
            "${value.hardware-path}"
            ./nixos
            {
                config = setup.nixos-config; 
            }
            home-manager.nixosModules.home-manager {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = { inherit inputs allowed-unfree-packages; };
                    users."${setup.username}" = { pkgs, ... }: {
                        imports = [ ./home-manager ];

                        config = {
                            home = {
                                username = "${setup.username}";
                                homeDirectory = "${setup.homeDirectory}";
                                packages = [ pkgs.home-manager ];
                                stateVersion = "24.05";
                            };
                        } // setup.config;
                    };
                };
            }
            {
                users.users.${setup.username} = {
                    isNormalUser = true;
                    description = "${name}";
                    extraGroups = [ "networkmanager" "wheel" "video" ];
                };
            }
            stylix.nixosModules.stylix
        ];
    }) hostsSet;
in
{
    inherit nixosConfigurations;
}
