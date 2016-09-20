#!/usr/bin/bash
#

# Dotfiles installer
echo "Starting dotfiles installation..."
install_stuff(){
	sudo apt -yq update 
	sudo apt -yq install vim zsh tmux byobu
}

# Are we running ubuntu/debian? if so install the basic stuff
if [ $OSTYPE = "linux-gnu" ];then
	echo "Linux OS Detected"
	if [ $(grep NAME /etc/os-release | awk -F\" '{print $2}'| head -1) = "Ubuntu" ] || [ $(grep NAME /etc/os-release | awk -F\" '{print $2}'| head -1) = "Debian" ];then
		echo "Dpkg system assumed, installing required software..."
		install_stuff
		if [ $? = 1 ];then
			echo "Installation error"
			exit 1
		fi
	else
		echo "Non dpkg system, software won't be installed"
	fi
else
	echo "Failed to identify running OS as Linux."
	echo "Script will stop now!"
	exit 1
fi

# Change shell to zsh
zsh --version 2>&1 >/dev/null
if [ $? = 0 ];then
	echo "Setting zsh as default shell"
	chsh $USER -s $(which zsh)
else
	echo "Installing zsh"
	sudo apt -yq install zsh && chsh $(USER) -s $(which zsh)
	if [ $? = 1 ];then 
		echo "Failed to install zsh!"
		exit 1
	fi
fi

# Install ohmyzsh
if [ $zsh_status != failed ];then
	echo "Installing Oh my Zsh..."
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	# configure zsh
	mv ~/.zshrc ~/.zshrc~
	ln -s ~/.dotfiles/zshrc ~/.zshrc
fi

# Vim setup
# Install vundle
echo "Configuring Vim"
echo "Installing vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim¬
# Now that we have the plugin manager, link the vimrc file and install plugins¬
mv ~/.vimrc ~/vimrc~
echo "Configuring Vim..."
ln -s ~/.dotfiles/vimrc ~/.vimrc
echo "Installing Vim Plugins..."
vim +PluginInstall +qall
echo "Dotfiles Installation completed."
# end
