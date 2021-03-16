#echo "  __  ___  ____    ___  _  _  __  ____    ___    __   _  _  ___ 
# / _)(  _)(_  _)  / __)( )( )(  )(_  _)  (   \  /  \ ( \( )(  _)
#( (/\ ) _)  )(    \__ \ )__(  )(   )(     ) ) )( () ) )  (  ) _)
# \__/(___) (__)   (___/(_)(_)(__) (__)   (___/  \__/ (_)\_)(___)
#"
neofetch
# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

set -g -x NNN_OPTS "H"
set -g -x O_NERD 1
