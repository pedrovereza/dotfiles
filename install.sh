DOTFILES_HOME=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)

BASH_PROFILE="$HOME/.bash_profile"
DOTFILES_INIT="$DOTFILES_HOME/init"

if [ ! -f $BASH_PROFILE ]; then
	echo 'Creating .bash_profile file'
	touch $BASH_PROFILE
fi

if ! grep -Fq $DOTFILES_INIT $BASH_PROFILE; then
	echo "source $DOTFILES_INIT" >> $BASH_PROFILE
fi

source $BASH_PROFILE
