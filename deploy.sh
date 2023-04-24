#!/bin/bash
set -eu

#-------p10k------
ln -sf $HOME/dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh
mkdir -p $HOME/.cache/gitstatus
#-------misc--------
ln -sf $HOME/dotfiles/.config/tmux/.tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.config/zsh/
mkdir -p $HOME/.zinit/

ln -sf $HOME/dotfiles/zsh/completion.zsh   $HOME/.config/zsh/completion.zsh
ln -sf $HOME/dotfiles/zsh/key-bindings.zsh $HOME/.config/zsh/key-bindings.zsh
ln -sf $HOME/dotfiles/zsh/zinit_plugin.zsh $HOME/.zinit/zinit_plugin.zsh
echo 'source $HOME/.zinit/zinit_plugin.zsh' >> $HOME/.zshrc
SHELL=/bin/zsh zsh -i -c -- 'zinit module build;zinit self-update'


ln -sf $HOME/dotfiles/zsh/cd_push.zsh      $HOME/.config/zsh/cd_push.zsh
ln -sf $HOME/dotfiles/.config/functions    $HOME/.config/functions

mkdir -p $HOME/.config/git
ln -sf $HOME/dotfiles/git/commit_template $HOME/.config/git/commit_template
ln -sf $HOME/dotfiles/git/hooks $HOME/.config/git/hooks

mv $HOME/.zshrc $HOME/.zinit_install.zsh
ln -sf $HOME/dotfiles/zsh/.zprofile $HOME/.zprofile
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/gitstatusd-linux-x86_64 $HOME/.cache/gitstatus/

ln -sf $HOME/dotfiles/.config/nvim $HOME/.config/nvim
nvim +":call mkdir(stdpath('config'), 'p')" +qall
nvim +":exe 'edit '.stdpath('config').'/init.vim'" +qall
sudo update-alternatives --install $(which vim) vim $(which nvim) 99
sudo update-alternatives --config vim
mkdir -p $HOME/.cache/dein

cd $HOME/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./dein.sh
sh ./dein.sh $HOME/.cache/dein && rm ./dein.sh
nvim +"UpdateRemotePlugins" +qall
cd /home/icd

echo '============finish=============='
