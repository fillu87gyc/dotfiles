# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/z/z.sh
export POWERLEVEL9K_DISABLE_GITSTATUS=true
source ~/.config/zsh/key-bindings.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/functions/ghq-sel.zsh
source ~/.config/functions/p10k_seg.zsh
source ~/.config/functions/fzf-z-search.zsh
source ~/.config/functions/nnn-preview.sh
source ~/.config/functions/pacman-install-selector.zsh
source ~/.config/zsh/cd_push.zsh
alias ll='exa -lahHg --git --git-ignore --tree -L 2 --icons -I \.git'
alias lll='exa -lahHg --git --git-ignore --tree -L 2 --icons --color=always |less -R'
alias lld='exa -lahHDg --git --git-ignore --tree -L 2 --icons'
alias vi='nvim'
alias so='source'
alias python='python3'
alias pip='pip3'
alias tmux='tmux -u'
alias rgh='rg -uu' # 隠しファイルとかgitignoreを検索範囲に入れる
alias g='git'
alias k='k -A' # 隠しファイルを含める
alias h='nnn-preview -H'
alias la='lazygit'
autoload -Uz compinit && compinit
setopt auto_cd
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/src/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/dotfiles/shell:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.local/lib/jumanpp/bin:$PATH
export XDG_CONFIG_HOME=~/.config
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" 2> /dev/null'
export FZF_DEFAULT_OPTS='--height 80% --reverse --border --preview "bat --color=always --style=header,grid --line-range :100 {}"'
export FZF_FIND_FILE_COMMAND='rg --files --hidden --follow --glob "!.git/*" 2> /dev/null'
export FZF_FIND_OPTS='--height 80% --reverse --border --preview "bat --color=always --style=header,grid --line-range :100 {}"'
export FZF_CD_COMMAND='find . -type d -name '.git' -prune -o -type d -follow -print 2> /dev/null'
export FZF_CD_OPTS='--height 80% --reverse --border --preview "exa -ahH --git --git-ignore --tree -L 2 --icons --color=always {} | head -200"'

#ライブラリの変更に合わせる
export FZF_CTRL_T_COMMAND=$FZF_FIND_FILE_COMMAND
export FZF_CTRL_T_OPTS=$FZF_FIND_OPTS
export FZF_ALT_C_COMMAND=$FZF_CD_COMMAND
export FZF_ALT_C_OPTS=$FZF_CD_OPTS
export NNN_OPENER=$HOME/dotfiles/shell/nnn_opener.sh
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=70%
export GOPATH=$HOME/go
export EDITOR='nvim'
export PYTHONPATH=$PYTHONPATH:/home/icd/.local/lib/python3.8/site-packages
source ~/.zinit_install.zsh

export HISTFILE=~/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 開始と終了を記録
setopt EXTENDED_HISTORY
alias juman='juman -r /usr/local/etc/jumanrc'
alias jn="jupyter-notebook &"
if [ -e /opt/ros/foxy/setup.zsh  ]; then
  source /opt/ros/foxy/setup.zsh
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {name}:{line_number}]:     {message}"
fi

if [ -e  $HOME/dev_ws/install/setup.zsh ]; then
  source $HOME/dev_ws/install/setup.zsh
fi

export MOCWORD_DATA=$HOME/.local/lib/mocword.sqlite

[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh

source $HOME/.zinit/zinit_plugin.zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init - zsh)"
# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/icd/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
