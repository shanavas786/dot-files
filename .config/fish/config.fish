set PATH $HOME/.cargo/bin $PATH

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
   echo -n '| '
   set_color normal
end

# no more geeting
set fish_greeting
