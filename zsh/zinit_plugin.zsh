zinit snippet OMZL::git.zsh
zinit snippet OMZP::git # <- なんかおまじないらしい
# 補完
# zinit light for \
#   zsh-users/zsh-autosuggestions \
#   zdharma/fast-syntax-highlighting \
#   zinit-zsh/z-a-bin-gem-node \
#   zinit-zsh/z-a-meta-plugins \
#   zinit-zsh/z-a-patch-dl
# クローンしたGit作業ディレクトリで、コマンド `git open` を実行するとブラウザでGitHubが開く
# zinit light paulirish/git-open
# zinit ice depth=1; zinit light romkatv/powerlevel10k
#
zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  z-shell/fast-syntax-highlighting \
                z-shell/history-search-multi-word \
    # light-mode pick"async.zsh" src"pure.zsh" \
    #             sindresorhus/pure
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
