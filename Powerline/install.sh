#!/bin/bash

# No testing, no error handling, no nothing. Pray and it will work.

brew install python
install vim --env-std --override-system-vim
https://github.com/Lokaltog/powerline/tarball/develop
echo "source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim" >> ~/.vimrc
echo "set laststatus=2" >> ~/.vimrc
echo "source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh" >> ~/.zshrc
pip install powerline-gitstatus
ln -s $(pwd)/config_files/colorschemes/default.json /usr/local/lib/python2.7/site-packages/powerline/config_files/colorschemes/default.json
ln -s $(pwd)/config_files/themes/shell/default.json /usr/local/lib/python2.7/site-packages/powerline/config_files/themes/shell/default.json

