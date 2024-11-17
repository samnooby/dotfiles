{ username, config, lib, ... }:

{
  programs.sway.enable = true;

  home-manager.users.${username} = { lib, config, ... }: {
    # home.sessionVariables = {
    #   XDG_RUNTIME_DIR = "${config.home.homeDirectory}/.run";
    # };
    
    # home.activation = {
    #  createRunDirectory = lib.hm.dag.entryAfter ["writeBoundary"] ''
    #    mkdir -p "${config.home.homeDirectory}/.run"
    #  '';
    # };
  };
}
