FROM alpine:3.4

MAINTAINER Marco Araujo <marco.araujo.junior@gmail.com>

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh curl ctags vim && \
    rm -rf /var/cache/apk/*

ARG PUID=1000
ARG PGID=1000
RUN addgroup -g $PGID workspace && adduser -D -G workspace -s /bin/false -u $PUID workspace

USER workspace

RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/workspace/.vim/bundle/Vundle.vim && \
    git clone https://github.com/marcoaraujojunior/dotfiles.git /home/workspace/.files && \
    cp /home/workspace/.files/.bash_environment /home/workspace/ && \
    cp /home/workspace/.files/.vimrc /home/workspace/ && \
    vim +source /home/workspace/.vimrc +qall && \
    vim +PluginInstall +qall

WORKDIR /home/workspace

ENTRYPOINT /bin/bash

CMD ["true"]


