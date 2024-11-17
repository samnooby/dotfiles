{ username, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    loginShellInit = '' 
      dbus-launch
      dbus-launch
      kitty
    '';
    promptInit = ''
      function fish_prompt
        string join "" -- (set_color green) $PWD (set_color normal) '>'
      end
    '';
  };
  users.users.${username}.shell = pkgs.fish;
}
