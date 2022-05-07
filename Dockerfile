FROM icduser/ubuntu-pure
ARG USERNAME=icd
ENV TERM=xterm-256color \
	COLORTERM=truecolor \
	XDG_CONFIG_HOME=/home/${USERNAME}/.config \
	TZ=Asia/Tokyo \
	DEBIAN_FRONTEND=noninteractive
USER root
RUN apt-get -y update &&\
	apt-get -y upgrade
RUN add-apt-repository ppa:neovim-ppa/unstable -y
RUN apt-get update -y
RUN apt-get install neovim -y
USER ${USERNAME}
WORKDIR /home/${USERNAME}
RUN sudo npm install neovim -g

RUN pip3 install \
	wheel\
	powerline-status\
	neovim \
  jedi

COPY --chown=${USERNAME}:${USERNAME} .config/nvim /home/${USERNAME}/.config/nvim
RUN sudo update-alternatives --install $(which vim) vim $(which nvim) 99
RUN sudo update-alternatives --config vim
RUN mkdir -p /home/${USERNAME}/.cache/dein
WORKDIR /home/${USERNAME}/.cache/dein
RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./installer.sh
RUN sh ./installer.sh /home/${USERNAME}/.cache/dein
RUN nvim +"UpdateRemotePlugins" +qall
WORKDIR /home/${USERNAME}

# #-------p10k------
# RUN /tmp/installer/p10k.sh
# COPY --chown=${USERNAME}:${USERNAME} zsh/powerlevel10k.zsh-theme /home/${USERNAME}/app/powerlevel10k/powerlevel10k.zsh-theme
COPY --chown=${USERNAME}:${USERNAME} zsh/.p10k4docker.zsh /home/${USERNAME}/.p10k.zsh
RUN mkdir -p /home/${USERNAME}/.cache/gitstatus
# 
#-------misc--------
COPY --chown=${USERNAME}:${USERNAME} git/.gitconfig /home/${USERNAME}/.gitconfig
COPY --chown=${USERNAME}:${USERNAME} .config/tmux/.tmux.conf /home/${USERNAME}/.tmux.conf

COPY --chown=${USERNAME}:${USERNAME} zsh/completion.zsh   /home/${USERNAME}/.config/zsh/completion.zsh
COPY --chown=${USERNAME}:${USERNAME} zsh/key-bindings.zsh /home/${USERNAME}/.config/zsh/key-bindings.zsh
COPY --chown=${USERNAME}:${USERNAME} zsh/zinit_plugin.zsh /home/${USERNAME}/.zinit/zinit_plugin.zsh
COPY --chown=${USERNAME}:${USERNAME} zsh/cd_push.zsh      /home/${USERNAME}/.config/zsh/cd_push.zsh
COPY --chown=${USERNAME}:${USERNAME} .config/functions    /home/${USERNAME}/.config/functions

RUN bash -c "$(curl -fsSL https://git.io/zinit-install)"
RUN echo 'source /home/${USERNAME}/.zinit/zinit_plugin.zsh' >> /home/${USERNAME}/.zshrc
RUN	SHELL=/bin/zsh zsh -i -c -- 'zinit module build;zinit self-update'
RUN sudo add-apt-repository ppa:longsleep/golang-backports -y
RUN sudo apt-get -y update
RUN sudo apt install golang -y
RUN go get -u github.com/motemen/ghq

COPY --chown=${USERNAME}:${USERNAME} git/commit_template  /home/${USERNAME}/.config/git/commit_template
COPY --chown=${USERNAME}:${USERNAME} git/hooks  /home/${USERNAME}/.config/git/hooks

RUN sudo npm install -g n
RUN sudo n latest
RUN git clone --depth 1 https://github.com/rupa/z /home/${USERNAME}/z &&\
	touch /home/${USERNAME}/.z

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0  && \
    sudo apt-add-repository https://cli.github.com/packages                        && \
    sudo apt-get update                                                            && \
    sudo apt-get install gh

RUN pip install -U flake8 flake8-import-order autopep8 black isort
RUN mv /home/${USERNAME}/.zshrc /home/${USERNAME}/.zinit_install.zsh
COPY --chown=${USERNAME}:${USERNAME} zsh/.zprofile /home/${USERNAME}/.zprofile
COPY --chown=${USERNAME}:${USERNAME} zsh/.zshrc /home/${USERNAME}/.zshrc
COPY --chown=${USERNAME}:${USERNAME} zsh/gitstatusd-linux-x86_64 /home/${USERNAME}/.cache/gitstatus/
RUN sudo chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.config
# 
# ----------------------------ここからしたinstaller.shに未適用----------------------
RUN pip install rich --no-warn-script-location -U
CMD /bin/zsh --login
