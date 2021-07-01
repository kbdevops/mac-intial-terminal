# Automated Initial Terminal mac bootstrap 
#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install zsh
brew install tree
brew install pwgen
brew install tmux
brew install node
brew install awscli
brew install telnet
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)
sed -i '.zshrc' 's/_THEME="robbyrussell"/_THEME="fino-time"/g' ~/.zshrc 
sed -i .zshrc 's/plugins=(/plugins=(zsh-autosuggestions /g' ~/.zshrc && source ~/.zshrc
touch ~/.vimrc && cat << EOF > ~/.vimrc
syntax on
set nu sw=2 ts=2 softtabstop=2 expandtab autoindent pastetoggle=&lt;f5&gt;
EOF
