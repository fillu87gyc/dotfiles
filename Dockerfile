FROM git.icd.cs.tut.ac.jp:5050/icd-tech/docker/ubuntu2004/dev
ARG USERNAME=icd
WORKDIR /home/${USERNAME}
USER icd

RUN mkdir $HOME/dotfiles
COPY --chown=${USERNAME}:${USERNAME} git             /home/${USERNAME}/dotfiles/git
COPY --chown=${USERNAME}:${USERNAME} independent.sh   /independent.sh
RUN /independent.sh
RUN git clone https://github.com/tmux-plugins/tpm    /home/icd/.tmux/plugins/tpm
COPY --chown=${USERNAME}:${USERNAME} .config	     /home/${USERNAME}/dotfiles/.config
COPY --chown=${USERNAME}:${USERNAME} .dockerignore   /home/${USERNAME}/dotfiles/.dockerignore
COPY --chown=${USERNAME}:${USERNAME} .gitignore      /home/${USERNAME}/dotfiles/.gitignore
COPY --chown=${USERNAME}:${USERNAME} .vs             /home/${USERNAME}/dotfiles/.vs
COPY --chown=${USERNAME}:${USERNAME} shell           /home/${USERNAME}/dotfiles/shell
COPY --chown=${USERNAME}:${USERNAME} zsh             /home/${USERNAME}/dotfiles/zsh

COPY --chown=${USERNAME}:${USERNAME} installer.sh   /installer.sh
RUN /installer.sh
RUN rm /home/icd/.config/nvim/undo/*
RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*
CMD /bin/zsh --login
