# install packages
sudo apt install git vim emacs stow build-essential curl wget fonts-inconsolata fonts-smc \
     fonts-hack autojump ripgrep fd-find editorconfig sqlite3 python3-dev python3-virtualenv \
     black pyflakes3 isort python3-pip python-flake8 shellcheck shfmt cmake libclang-dev \
     imagemagick pass

stow config -t ~/.config
stow bash -t ~
stow editorconfig -t ~
stow vim -t ~
stow clang -t ~
stow python -t ~
