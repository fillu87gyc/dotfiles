brew install \
curl \
	fzf \
	jq \
	nnn \
	nodejs \
	nodebrew \
    jq\
    tig \
	tmux \
	tree \
	vim \
	wget \
	zsh \
	golang \
    python3.8-venv\
    neovim

mkdir -p ~/.nodebrew/src
nodebrew install-binary latest
nodebrew use latest
go install github.com/x-motemen/ghq@latest

pip install powerline-mem-segment

defaults write -g KeyRepeat -int 3