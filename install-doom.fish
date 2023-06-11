git clone --depth 1 https://github.com/doomemacs/doomemacs /opt/doomemacs

ln -s /opt/doomemacs $HOME/.config/emacs

ln -s (pwd)/config/doom $HOME/.config/doom

/opt/doomemacs/bin/doom install


