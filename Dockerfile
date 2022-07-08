FROM yavin99-ws.local:5000/ubuntu/japanese
ARG USERNAME=icd
WORKDIR /home/${USERNAME}
COPY --chown=${USERNAME}:${USERNAME} . /home/${USERNAME}/dotfiles
RUN /home/${USERNAME}/dotfiles/installer.sh
CMD /bin/zsh --login
