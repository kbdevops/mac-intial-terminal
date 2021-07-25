#!/bin/bash
 
###################################################################
#Script Name	  : setup-terminal.sh                                                                                            
#Description	  : Automated Initial Terminal mac bootstrap                                                                                                                                                                     
#Author       	: Kunal Bangia                                                
#Email         	: kunalbangia@live                                          
###################################################################

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install zsh & terminal utilities
brew install zsh
brew install tree
brew install pwgen
brew install tmux
brew install node
brew install awscli
brew install telnet

# Install OMZ robbyrussell theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get a zsh-[autosuggestions & syntax-highlighting.git] and add to zsh path
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add vscode terminal shortcut to zsh
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;} >> ~/.zshrc

# Update .zshrc conf file
sed -i '.zshrc' 's/_THEME="robbyrussell"/_THEME="fino-time"/g' ~/.zshrc 
sed -i '.zshrc' 's/plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /g' ~/.zshrc 

source ~/.zshrc

# Basic vim developer .conf setup
touch ~/.vimrc && cat << EOF > ~/.vimrc
syntax on
set nu sw=2 ts=2 softtabstop=2 expandtab autoindent pastetoggle=&lt;f5&gt;
EOF
