ZSHRC="$HOME/.zshrc"
DOTFILES_INIT="$DOTFILES_HOME/dotfiles/init"

if [ ! -f $ZSHRC ]; then
	echo 'Creating .zshrc file'
	touch $ZSHRC
fi

if ! grep -Fq $DOTFILES_INIT $ZSHRC; then
	echo "source $DOTFILES_INIT" >> $ZSHRC
fi

source $ZSHRC
