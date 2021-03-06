set -eu
export USERNAME=icd
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
   	bat \
	clang \
	curl \
	fzf \
	gist \
	hub \
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
	peco \
	golang \
	python3-pip

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

pip3 install \
    wheel\
    powerline-status\
    neovim \
    jedi

mkdir -p $HOME/.config/
ln -sf $HOME/dotfiles/.config/nvim /home/icd/.config/nvim
/usr/bin/nvim +":call mkdir(stdpath('config'), 'p')" +qall
/usr/bin/nvim +":exe 'edit '.stdpath('config').'/init.vim'" +qall
sudo update-alternatives --install $(which vim) vim $(which nvim) 99
sudo update-alternatives --config vim
mkdir -p /home/icd/.cache/dein
cd /home/icd/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./installer.sh
sh ./installer.sh /home/icd/.cache/dein
nvim +"UpdateRemotePlugins" +qall
cd /home/icd
# #-------p10k------
ln -sf $HOME/dotfiles/zsh/.p10k.zsh /home/icd/.p10k.zsh
mkdir -p /home/icd/.cache/gitstatus
#-------misc--------
ln -sf $HOME/dotfiles/git/.gitconfig /home/icd/.gitconfig
ln -sf $HOME/dotfiles/.config/tmux/.tmux.conf /home/icd/.tmux.conf
mkdir -p $HOME/.config/zsh/
mkdir -p $HOME/.zinit/

ln -sf $HOME/dotfiles/zsh/completion.zsh   /home/icd/.config/zsh/completion.zsh
ln -sf $HOME/dotfiles/zsh/key-bindings.zsh /home/icd/.config/zsh/key-bindings.zsh
ln -sf $HOME/dotfiles/zsh/zinit_plugin.zsh /home/icd/.zinit/zinit_plugin.zsh
ln -sf $HOME/dotfiles/zsh/cd_push.zsh      /home/icd/.config/zsh/cd_push.zsh
ln -sf $HOME/dotfiles/.config/functions    /home/icd/.config/functions

if [ -e $HOME/.zshrc ]; then
	rm $HOME/.zshrc
fi
bash -c "$(curl -fsSL https://git.io/zinit-install)"
echo 'source /home/icd/.zinit/zinit_plugin.zsh' >> /home/icd/.zshrc
	SHELL=/bin/zsh zsh -i -c -- 'zinit module build;zinit self-update'
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get -y update
sudo apt-get -y install golang
go install github.com/x-motemen/ghq@latest

mkdir -p $HOME/.config/git
ln -sf $HOME/dotfiles/git/commit_template /home/icd/.config/git/commit_template
ln -sf $HOME/dotfiles/git/hooks /home/icd/.config/git/hooks

sudo npm install -g n
sudo n latest
git clone --depth 1 https://github.com/rupa/z /home/icd/z &&\
touch $HOME/.z

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0  && \
sudo apt-add-repository https://cli.github.com/packages                        && \
sudo apt-get update                                                            && \
sudo apt-get install gh
curl -fsSL https://deno.land/install.sh | sh
pip install -U flake8 flake8-import-order autopep8 black isort rich --no-warn-script-location
sudo apt install python3.8-venv -y
mv /home/icd/.zshrc /home/icd/.zinit_install.zsh
ln -sf $HOME/dotfiles/zsh/.zprofile /home/icd/.zprofile
ln -sf $HOME/dotfiles/zsh/.zshrc /home/icd/.zshrc
ln -sf $HOME/dotfiles/zsh/gitstatusd-linux-x86_64 /home/icd/.cache/gitstatus/
sudo chown icd:icd /home/icd/.config
$HOME/go/bin/ghq get https://github.com/jarun/nnn
cd $HOME/src/github.com/jarun/nnn &&\
    sudo apt-get install libreadline-dev -y &&\
    make O_NERD=1 && cd
wget https://github.com/high-moctane/mocword-data/releases/download/eng20200217/mocword.sqlite.gz &&\
    gzip -d mocword.sqlite.gz &&\
    mv mocword.sqlite /home/icd/.local/lib/mocword.sqlite &&\
    $HOME/.cargo/bin/cargo install mocword 
echo '============finish=============='
