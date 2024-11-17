{ username, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    loginShellInit = '' 
      if not set -q DBUS_SESSION_BUS_ADDRESS
        # Start dbus-launch and export the variables it provides
        set -lx DBUS_SESSION_BUS_ADDRESS (dbus-launch --sh-syntax | string match -r '^export DBUS_SESSION_BUS_ADDRESS=(.*)' | string replace 'export DBUS_SESSION_BUS_ADDRESS=" "')
      end
    '';
    promptInit = ''
      function fish_prompt
        string join "" -- (set_color green) $PWD (set_color normal) '>'
      end
    '';
  };
  users.users.${username}.shell = pkgs.fish;
}
