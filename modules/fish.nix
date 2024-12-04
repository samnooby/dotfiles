{ lib, config, pkgs, ... }:

{
  options.fish = {
    enabled = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    defaultShell = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.fish.enabled {
    programs.fish = {
      enable = true;
      shellAliases = {
        g = "git";
        ".." = "cd ..";
        "..." = "cd ../..";
        ll = "ls -lah";
      };
      shellAbbrs = {
        projects = "cd ~/Projects/";
        gco = "git checkout";
      };
      functions = {
        fish_greeting = ''
          echo "Welcome back, Sam Newby! (Leave if you're not Sam Newby)"
          echo ""
          echo "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⡋⠉⠙⠒⢤⡀⠀⠀⠀⠀⠀⢠⠖⠉⠉⠙⠢⡄⠀"
          echo "⠀⠀⠀⠀⠀⠀⢀⣼⣟⡒⠒⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠹⡄"
          echo "⠀⠀⠀⠀⠀⠀⣼⠷⠖⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⢷"
          echo "⠀⠀⠀⠀⠀⠀⣷⡒⠀⠀⢐⣒⣒⡒⠀⣐⣒⣒⣧⠀⠀⡇⠀⢠⢤⢠⡠⠀⠀⢸"
          echo "⠀⠀⠀⠀⠀⢰⣛⣟⣂⠀⠘⠤⠬⠃⠰⠑⠥⠊⣿⠀⢴⠃⠀⠘⠚⠘⠑⠐⠀⢸"
          echo "⠀⠀⠀⠀⠀⢸⣿⡿⠤⠀⠀⠀⠀⠀⢀⡆⠀⠀⣿⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⣸"
          echo "⠀⠀⠀⠀⠀⠈⠿⣯⡭⠀⠀⠀⠀⢀⣀⠀⠀⠀⡟⠀⠀⢸⠀⠀⠀⠀⠀⠀⢠⠏"
          echo "⠀⠀⠀⠀⠀⠀⠀⠈⢯⡥⠄⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀⠀⠳⢄⣀⣀⣀⡴⠃⠀"
          echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡦⣄⣀⣀⣀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀"
          echo "⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⠛⠃⠀⠀⠀⢹⠳⡶⣤⡤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀"
          echo "⠀⠀⠀⠀⣠⢴⣿⣿⣿⡟⡷⢄⣀⣀⣀⡼⠳⡹⣿⣷⠞⣳⠀⠀⠀⠀⠀⠀⠀⠀"
          echo "⠀⠀⠀⢰⡯⠭⠹⡟⠿⠧⠷⣄⣀⣟⠛⣦⠔⠋⠛⠛⠋⠙⡆⠀⠀⠀⠀⠀⠀⠀"
          echo "⠀⠀⢸⣿⠭⠉⠀⢠⣤⠀⠀⠀⠘⡷⣵⢻⠀⠀⠀⠀⣼⠀⣇⠀⠀⠀⠀⠀⠀⠀"
          echo "⠀⠀⡇⣿⠍⠁⠀⢸⣗⠂⠀⠀⠀⣧⣿⣼⠀⠀⠀⠀⣯⠀⢸⠀⠀⠀⠀⠀⠀⠀ "
        '';
        home = ''
          if test (count $argv) -eq 1
            home-manager switch --flake .#$argv[1]
          else
            echo "Usage: home <flake name>"
          end
        '';
        gamend = ''
          git add --all
          git commit --amend --no-edit
        '';
        cdl = ''
          if test (count $argv) -eq 1
            cd $argv[1]
            ls -lah
          else
            echo "Usage: cdl <target directory>"
          end
        '';
        p = ''
          if test -z $argv
            echo "Usage: p <project name>"
            return 1
          end

          set project_dir ~/Projects/$argv[1]
          if test -d $project_dir
            cd $project_dir
          else
            echo "Project not found: $argv[1]"
            return 1
          end
        '';
      };
      shellInit =
        "tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='12-hour format' --rainbow_prompt_separators=Slanted --powerline_prompt_heads=Slanted --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=No --prompt_spacing=Sparse --icons='Many icons' --transient=No\n      ";
      plugins = [{
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }];
    };
  };
}
