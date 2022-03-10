FILE=~/.vim/autoload/plug.vim

if ! [ -f "$FILE" ]; then
    curl -fLo $FILE --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

sudo cp ./vimrc.local /etc/vim

vim +'PlugInstall --sync' +qa

SOURCE_TEXT='source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"'

if [ -f "~/.bashrc" ]; then
    grep -qxF "$SOURCE_TEXT" ~/.bashrc || echo "$SOURCE_TEXT" >> ~/.bashrc
fi

if [ -f "~/.zshrc" ]; then
    grep -qxF "$SOURCE_TEXT" ~/.zshrc || echo "$SOURCE_TEXT" >> ~/.zshrc
fi