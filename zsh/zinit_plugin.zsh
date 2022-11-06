zinit snippet OMZL::git.zsh
zinit snippet OMZP::git # <- なんかおまじないらしい

zinit ice depth=1; zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light z-shell/fast-syntax-highlighting
zinit ice depth=1; zinit light z-shell/H-S-MW
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice depth=1; zinit light paulirish/git-open
zinit ice depth=1; zinit light supercrabtree/k

# ----------------------------------
# 補完を有効にする
# ----------------------------------
# Docker
if [ ! -e ~/.zsh/completion/_docker ]; then
  # ファイルがなければダウンロード
  mkdir -p ~/.zsh/completion
  curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
fi

docker_comp(){
  fpath=(~/.zsh/completion $fpath)
}

docker_comp

# Docker-Compose
if [ ! -e ~/.zsh/completion/_docker-compose ]; then
  # ファイルがなければダウンロード
  mkdir -p ~/.zsh/completion
  curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
fi

docker_compose_comp(){
  fpath=(~/.zsh/completion $fpath)
}

docker_compose_comp
