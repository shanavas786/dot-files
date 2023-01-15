set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH
set CDPATH . /opt $CDPATH

set -x EDITOR 'emacsclient -t -c'
set -x VISUAL 'emacsclient -t -c'
set -x ALTERNATE_EDITOR 'vim'

if command -v exa > /dev/null
   abbr -a l 'exa'
   abbr -a ls 'exa'
   abbr -a ll 'exa -l'
   abbr -a lll 'exa -la'
else
   abbr -a l 'ls'
   abbr -a ll 'ls -l'
   abbr -a lll 'ls -la'
end

if command -v git > /dev/null
   abbr -a g git
   abbr -a gco git checkout
   abbr -a gc git commit
   abbr -a ga git add
   abbr -a gd git diff
   abbr -a gds git diff --cached
end

if command -v emacsclient > /dev/null
   abbr -a vi emacsclient -c
   abbr -a e emacsclient -c
end

if command -v python3 > /dev/null
   abbr -a py python3
end

abbr -a ... '../../'

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 2


function fish_prompt
   set_color blue
   echo -n (hostname)
   if [ $PWD != $HOME ]
      set_color brblack
      echo -n ':'
      set_color yellow
      echo -n (prompt_pwd)
   end
   set_color green
   printf '%s ' (__fish_git_prompt)
   set_color red
   echo -n '❯ '
   set_color normal
end

# no more geeting
set fish_greeting

# configure autojump
if test -e /usr/share/autojump/autojump.fish
    . /usr/share/autojump/autojump.fish
end

# start tmux
# if status --is-interactive
#    if command -v tmux > /dev/null
#        tmux -u ^ /dev/null; and exec true
#    end
# end

# set -x JAVA_HOME (readlink -f /home/shanavas/.nix-profile/bin/java | sed "s:/bin/java::")
set -x JAVA_HOME (readlink -f (which java) | sed "s:/bin/java::")

set -x ANDROID_HOME /opt/Android/Sdk

if command -v starship > /dev/null
  starship init fish | source
end

# pyenv init - | source
