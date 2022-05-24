# source ~/app/powerlevel10k/powerlevel10k.zsh-theme
source ~/z/z.sh
source ~/.p10k.zsh
export POWERLEVEL9K_DISABLE_GITSTATUS=true
source ~/.config/zsh/key-bindings.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/functions/ghq-sel.zsh
source ~/.config/functions/p10k_seg.zsh
source ~/.config/functions/fzf-z-search.zsh
source ~/.config/functions/pacman-install-selector.zsh
source ~/.config/zsh/cd_push.zsh
# source /opt/ros/rolling/setup.zsh
alias ll='exa -lahHg --git --git-ignore --tree -L 2 --icons -I \.git'
alias lll='exa -lahHg --git --git-ignore --tree -L 2 --icons --color=always |less -R'
alias lld='exa -lahHDg --git --git-ignore --tree -L 2 --icons'
alias vi='nvim'
alias so='source'
alias bat='batcat'
alias cat='bat'
alias python='python3'
alias pip='pip3'
alias tmux='tmux -u'
alias rgh='rg -uu' # 隠しファイルとかgitignoreを検索範囲に入れる
alias g='git'
alias k='k -A' # 隠しファイルを含める
autoload -Uz compinit && compinit
setopt auto_cd
export PATH=~/.gem/ruby/2.7.0/bin:$PATH
export PATH=~/.local/share/gem/ruby/2.7.0/bin:$PATH
export PATH=~/src/go/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/go/bin:$PATH
export XDG_CONFIG_HOME=~/.config
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" 2> /dev/null'
export FZF_DEFAULT_OPTS='--height 80% --reverse --border --preview "batcat --color=always --style=header,grid --line-range :100 {}"'
export FZF_FIND_FILE_COMMAND='rg --files --hidden --follow --glob "!.git/*" 2> /dev/null'
export FZF_FIND_OPTS='--height 80% --reverse --border --preview "batcat --color=always --style=header,grid --line-range :100 {}"'
export FZF_CD_COMMAND='find . -type d -name '.git' -prune -o -type d -follow -print 2> /dev/null'
export FZF_CD_OPTS='--height 80% --reverse --border --preview "exa -ahH --git --git-ignore --tree -L 2 --icons --color=always {} | head -200"'

#ライブラリの変更に合わせる
export FZF_CTRL_T_COMMAND=$FZF_FIND_FILE_COMMAND
export FZF_CTRL_T_OPTS=$FZF_FIND_OPTS
export FZF_ALT_C_COMMAND=$FZF_CD_COMMAND
export FZF_ALT_C_OPTS=$FZF_CD_OPTS

export FZF_TMUX=1
export FZF_TMUX_HEIGHT=70%

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
eval "$(gh completion -s zsh)"
alias rd='
docker run\
  --rm -it \
  --volume /home/icd/dev_ws:/home/icd/dev_ws \
  --workdir /home/icd/dev_ws \
  icduser2022/ros2 zsh --login'

if [ -e /opt/ros/foxy/setup.zsh  ]; then
  source /opt/ros/foxy/setup.zsh 
fi

if [ -e  $HOME/dev_ws/install/setup.zsh ]; then
  source $HOME/dev_ws/install/setup.zsh
fi


