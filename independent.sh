#!/bin/bash
set -eu
export USERNAME=icd
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
   	bat \
	clang \
	curl \
	fzf \
	jq \
	nnn \
	nodejs \
	npm \
	sed \
	tig \
	tmux \
	tree \
	vim \
	wget \
	zsh \
	golang \
	python3-pip \
    python3.8-venv 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 23F3D4EA75716059
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get -y update
sudo apt-get -y install golang unzip
go install github.com/x-motemen/ghq@latest

$HOME/go/bin/ghq get https://github.com/jarun/nnn
cd $HOME/src/github.com/jarun/nnn &&\
    sudo apt-get install libreadline-dev -y &&\
    make O_NERD=1 && cd

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
sudo apt-get install neovim -y
sudo npm install neovim -g
curl https://sh.rustup.rs -sSf > /tmp/rust_init.sh &&\
	chmod 755 /tmp/rust_init.sh  &&\
	/tmp/rust_init.sh -y   &&\
	. ~/.cargo/env  &&\
	$HOME/.cargo/bin/cargo install ripgrep &&\
	$HOME/.cargo/bin/cargo install exa
wget https://github.com/high-moctane/mocword-data/releases/download/eng20200217/mocword.sqlite.gz &&\
    gzip -d mocword.sqlite.gz &&\
    mv mocword.sqlite /home/icd/.local/lib/mocword.sqlite &&\
    $HOME/.cargo/bin/cargo install mocword 

curl -fsSL https://deno.land/install.sh | sh
pip3 install \
    wheel\
    powerline-status\
    neovim \
    jedi \
    flake8 \
    flake8-import-order \
    autopep8 \
    black \
    isort \
    rich --no-warn-script-location

if [ -e $HOME/.zshrc ]; then
	rm $HOME/.zshrc
fi

mkdir -p $HOME/.config/
bash -c "$(curl -fsSL https://git.io/zinit-install)"
echo 'source /home/icd/.zinit/zinit_plugin.zsh' >> /home/icd/.zshrc
	SHELL=/bin/zsh zsh -i -c -- 'zinit module build;zinit self-update'

sudo npm install -g n
sudo n latest
git clone --depth 1 https://github.com/rupa/z /home/icd/z &&\
touch $HOME/.z
