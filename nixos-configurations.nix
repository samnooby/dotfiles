{ hostDir, inputs, nixpkgs, home-manager, allowed-unfree-packages, ... }:
with builtins;

let
    hostsDirContent = attrNames readDir hostDir;
    hosts = filter (hostName :
        pathExists "${toString hostDir}/${hostName}/hardware-configuration.nix" &&
        pathExists "${toString hostDir}/${hostName}/home.nix"
    ) hostsDirContent;
    nixosConfigurations = mapAttrs (name: let 
        setup = import "${toString hostDir}/${name}/home.nix" {};
        pkgs = nixpkgs.legacyPackages.${setup.system};
    in pkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
            "${toString hostDir}/${name}/hardware-configuration.nix"
            ./nixos
            home-manager.nixosModules.home-manager {
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = { inherit inputs system; };
                    "${setup.username}" = { pkgs, ... }: {
                        imports = [./home-manager];

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
        ];
    });
in
{
    inherit nixosConfigurations;
}