if [! -d "~/.local/share/fonts" ]; then
	mkdir -p ~/.local/share/fonts
fi

for file in fonts/*; do 
	unzip -n $file -d ~/.local/share/fonts/
done

fc-cache -f -v
