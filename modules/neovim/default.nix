{ username, pkgs, ... }:

let
  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.bash
    p.comment
    p.css
    p.dockerfile
    p.fish
    p.gitattributes
    p.gitignore
    p.go
    p.gomod
    p.gowork
    p.hcl
    p.javascript
    p.jq
    p.json5
    p.json
    p.lua
    p.make
    p.markdown
    p.nix
    p.python
    p.rust
    p.toml
    p.typescript
    p.vue
    p.yaml
  ]));
  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      gcc14
      nodejs_22
      cargo
      unzip
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      withNodeJs = true;
      extraLuaConfig = ''
        require("config.lazy")
      '';
      plugins = [
        # treesitterWithGrammars
      ];
    };
    home.file."./.config/nvim/" = {
      source = ./config;
      recursive = true;
    };

    # home.file."./local/share/nvim/nix/nvim-treesitter/" = {
    #   source = treesitterWithGrammars;
    #   recursive = true;
    # };
  };

  environment.variables.EDITOR = "nvim";
}
