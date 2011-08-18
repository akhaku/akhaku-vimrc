#!/bin/sh

move_old_vim_files(){
if [ -e "$HOME/.vim" ]; then
    echo "Moving old .vim to .vim-old"
    mv "$HOME/.vim" "$HOME/.vim-old"
fi

if [ -e "$HOME/.vimrc" ]; then
    echo "Moving old .vimrc to .vimrc-old"
    mv "$HOME/.vimrc" "$HOME/.vimrc-old"
fi

}

setup_vim_hardlinks(){
    current_dir=`pwd`
    ln -t "$HOME" "$current_dir/.vim" ".vim"
    ln -t "$HOME" "$current_dir/.vimrc" ".vimrc"
}

printf """
Ammar's Vimrc
@author: Ammar Khaku (akhaku)
Requires Vim7 compiled with ruby support for some of the ruby stuff

"""
move_old_vim_files

setup_vim_hardlinks

