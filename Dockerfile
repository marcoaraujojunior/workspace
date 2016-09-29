FROM alpine:3.4

MAINTAINER Marco Araujo <marco.araujo.junior@gmail.com>

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh curl ctags vim && \
    rm -rf /var/cache/apk/*

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    git clone https://github.com/marcoaraujojunior/dotfiles.git ~/.files && \
    cp ~/.files/.bash_environment ~/ && \
    cp ~/.files/.vimrc ~/ && \
    vim +source ~/.vimrc +qall && \
    vim +PluginInstall +qall

