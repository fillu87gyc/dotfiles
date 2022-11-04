#!/bin/bash
set -eu

#-------p10k------
ln -sf $HOME/dotfiles/zsh/.p10k.zsh /home/icd/.p10k.zsh
mkdir -p /home/icd/.cache/gitstatus
#-------misc--------
ln -sf $HOME/dotfiles/.config/tmux/.tmux.conf /home/icd/.tmux.conf
mkdir -p $HOME/.config/zsh/
mkdir -p $HOME/.zinit/

ln -sf $HOME/dotfiles/zsh/completion.zsh   /home/icd/.config/zsh/completion.zsh
ln -sf $HOME/dotfiles/zsh/key-bindings.zsh /home/icd/.config/zsh/key-bindings.zsh
ln -sf $HOME/dotfiles/zsh/zinit_plugin.zsh /home/icd/.zinit/zinit_plugin.zsh
echo 'source /home/icd/.zinit/zinit_plugin.zsh' >> /home/icd/.zshrc
SHELL=/bin/zsh zsh -i -c -- 'zinit module build;zinit self-update'


ln -sf $HOME/dotfiles/zsh/cd_push.zsh      /home/icd/.config/zsh/cd_push.zsh
ln -sf $HOME/dotfiles/.config/functions    /home/icd/.config/functions

mkdir -p $HOME/.config/git
ln -sf $HOME/dotfiles/git/commit_template /home/icd/.config/git/commit_template
ln -sf $HOME/dotfiles/git/hooks /home/icd/.config/git/hooks

mv /home/icd/.zshrc /home/icd/.zinit_install.zsh
ln -sf $HOME/dotfiles/zsh/.zprofile /home/icd/.zprofile
ln -sf $HOME/dotfiles/zsh/.zshrc /home/icd/.zshrc
ln -sf $HOME/dotfiles/zsh/gitstatusd-linux-x86_64 /home/icd/.cache/gitstatus/

ln -sf $HOME/dotfiles/.config/nvim /home/icd/.config/nvim
/usr/bin/nvim +":call mkdir(stdpath('config'), 'p')" +qall
/usr/bin/nvim +":exe 'edit '.stdpath('config').'/init.vim'" +qall
sudo update-alternatives --install $(which vim) vim $(which nvim) 99
sudo update-alternatives --config vim
mkdir -p /home/icd/.cache/dein

cd /home/icd/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./dein.sh
sh ./dein.sh /home/icd/.cache/dein && rm ./dein.sh
nvim +"UpdateRemotePlugins" +qall
cd /home/icd

echo '============finish=============='
