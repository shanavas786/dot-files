if [ -f $HOME/.config/fish/config.fish ]; then
	rm $HOME/.config/fish/config.fish
	ln -s `pwd`/config/fish/config.fish $HOME/.config/fish/config.fish
else:
	echo "Fish config directory doesn't exist, creating one"
	mkdir -p $HOME/.config/fish
	ln -s `pwd`/config/fish/config.fish $HOME/.config/fish/config.fish
fi

# completions
if [ -f $HOME/.config/fish/completions ]; then
	rmdir $HOME/.config/fish/completions
	ln -s `pwd`/config/fish/completions $HOME/.config/fish/completions
else:
	ln -s `pwd`/config/fish/completions $HOME/.config/fish/completions
fi
