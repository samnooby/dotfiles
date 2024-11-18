{ username, pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };
  users.users.${username}.shell = pkgs.fish;

  environment.systemPackages = [
    pkgs.fortune
  ];

  home-manager.users.${username} = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        function fish_greeting
          fortune
        end
        tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='12-hour format' --rainbow_prompt_seperators=Slanted --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=No --prompt_spacing=Sparse --icons='Many icons' --transient=No
      '';
      plugins = [
        { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      ];
    };
  };
}
