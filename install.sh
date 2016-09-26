#!/usr/bin/bash

#
# Lazy script to install my dotfiles...
#

software_to_install="vim zsh tmux byobu"

# Dotfiles installer
echo "Starting dotfiles installation..."

# Some functions

install_stuff(){

	sudo apt -yq update &>/dev/null
	for software in $software_to_install
	do
		echo "Installing $software"
		sudo apt -yq $software &>/dev/null
		if [ $? != 0 ];then
			echo "$software installed OK"
		else 
			echo "Failed to install $software"
		fi
	done
}

# Are we running ubuntu/debian? if so install the basic stuff
if [ $OSTYPE = "linux-gnu" ];then
	if [ $(grep NAME /etc/os-release | awk -F\" '{print $2}'| head -1) = "Ubuntu" ] || [ $(grep NAME /etc/os-release | awk -F\" '{print $2}'| head -1) = "Debian" ];then
		install_stuff
	else
		echo "Non dpkg system; Software won't be installed because I am lazy to port this script to any other package
		management system"
	fi
else
	echo "OS is not Linux? Really?"
	exit 1
fi

# Change shell to zsh
type zsh &>/dev/null
if [ $? = 0 ];then
	echo "Setting zsh as default shell"
	chsh $USER -s $(type -p zsh | awk '{print $3}')
else
	echo "zsh not found!";exit 1
fi

# Install ohmyzsh
echo "Installing Oh my Zsh..."
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mv -f ~/.zshrc ~/.zshrc~ &>/dev/null
ln -s ~/.dotfiles/zshrc ~/.zshrc

# Install vundle
echo "Installing vim plugins"
if [ -d ~/.vim/bundle ];then
	mv -f ~/.vim/bundle ~/.vim/bundle~
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Now that we have the plugin manager, link the vimrc file and install plugins
if [ -f ~/.vimrc ];then
	mv -f ~/.vimrc ~/.vimrc~
fi
ln -s ~/.dotfiles/vimrc ~/.vimrc
#vim +PluginInstall +qall

# install tmux config
if [ -f ~/.tmux.conf];then
	mv -f ~/.tmux.conf ~/.tmux.conf~
fi
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

echo "Dotfiles Installation completed."
