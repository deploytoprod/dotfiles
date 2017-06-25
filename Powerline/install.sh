#!/bin/bash

# No testing, no error handling, no nothing. Pray and it will work.
# Trust me.

brew install python
brew install vim --env-std --override-system-vim 
sudo pip install https://github.com/Lokaltog/powerline/tarball/develop
echo "source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim" >> ~/.vimrc
echo "set laststatus=2" >> ~/.vimrc
echo "source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh" >> ~/.zshrc
sudo pip install powerline-gitstatus
sudo rm -fR /usr/local/lib/python2.7/site-packages/powerline/config_files/colorschemes/default.json
sudo rm -fR /usr/local/lib/python2.7/site-packages/powerline/config_files/themes/shell/default.json
sudo ln -s $(pwd)/config_files/colorschemes/shell/default.json /usr/local/lib/python2.7/site-packages/powerline/config_files/colorschemes/shell/default.json
sudo ln -s $(pwd)/config_files/themes/shell/default.json /usr/local/lib/python2.7/site-packages/powerline/config_files/themes/shell/default.json
