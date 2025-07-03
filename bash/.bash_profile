# profile
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:/opt/bin:$PATH"
export CDPATH=".:/opt:$CDPATH"
# set PATH $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin $HOME/.nix-profile/bin $PATH

export EDITOR='emacsclient -t -c'
export VISUAL='emacsclient -t -c'
export ALTERNATE_EDITOR='vim'
export DOCKER_HOST=unix:///var/run/docker.sock

export DEBEMAIL="shanavas.m@proton.me"
export DEBFULLNAME="Shanavas M"
export DEBOOTSTRAP_DIR="/usr/share/debootstrap"

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

. "$HOME/.cargo/env"

if command -v java > /dev/null; then
    export JAVA_HOME=$(readlink -f $(which java) | sed "s:/bin/java::")
fi


. "$HOME/.atuin/bin/env"
