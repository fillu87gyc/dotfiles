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
