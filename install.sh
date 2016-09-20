#!/usr/bin/bash
#
# Dotfiles installer
echo "Starting dotfiles installation..."

install_stuff(){
	sudo apt -f update
	sudo apt -f install vim
#	sudo apt -f install git 
	sudo apt -f install zsh
	sudo apt -f install tmux
	sudo apt -f install byobu
}

# Are we running ubuntu/debian? if so install the basic stuff
if [ $OSTYPE = "linux-gnu" ];then
	echo "Linux OS Detected"
	if [ $(grep DISTRIB_ID /etc/os-release) = Ubuntu || $(grep DISTRIB_ID /etc/os-release) = Debian ];then
		echo "Dpkg system assumed, installing required software..."
		install_stuff
	else
		echo "Non dpkg system, software won't be installed"
	fi
else
	echo "Failed to identify running OS as Linux."
	echo "Script will stop now!"
	exit 1
fi

# Clone dotfiles repo
echo "Cloning dotfiles repo..."
git clone https://github.com/lopezmts/dotfiles.git ~/.dotfiles

# Change shell to zsh
zsh --version 2>&1 >/dev/null
if [ $? = 0 ];then
	echo "Setting zsh as default shell"
	chsh $USER -s $(which zsh)
else
	echo "zsh is not installed!"
	sudo apt -f install zsh && chsh $(USER) -s $(which zsh)
	if [ $? = 1 ];then 
		echo "Failed to install zsh!"
		zsh_status=failed
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
