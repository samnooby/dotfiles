{ username, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    loginShellInit = '' 
    # Launch DBus and capture output
    set new_vars (dbus-launch)
    
    # Loop through each line of output
    for line in $new_vars
        # Split each line into key and value at the first '='
        set split_var (string split -m1 "=" $line)
    
        # Ensure both key and value exist before setting as environment variable
        if test (count $split_var) -eq 2
            echo "Creating Environment Variable"
            echo $split_var[1]
            echo $split_var[2]
            set -Ux $split_var[1] $split_var[2]
        end
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
