#!/bin/sh

# Determine the directory where this script is located
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

move_old_vim_files() {
    if [ -e "$HOME/.vim" ]; then
        echo "Moving old .vim to .vim-old"
        mv "$HOME/.vim" "$HOME/.vim-old" 2>/dev/null || echo "Could not move .vim (maybe .vim-old exists?)"
    fi

    if [ -e "$HOME/.vimrc" ]; then
        echo "Moving old .vimrc to .vimrc-old"
        mv "$HOME/.vimrc" "$HOME/.vimrc-old" 2>/dev/null || echo "Could not move .vimrc (maybe .vimrc-old exists?)"
    fi
}

setup_vim_softlinks() {
    printf "Making soft links to .vim and .vimrc\n"
    ln -sf "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"
    ln -sf "$SCRIPT_DIR" "$HOME/.vim"
    printf "Done.\n\n"
}

get_all_plugins() {
    printf "getting plugins now\n"
    if command -v python >/dev/null 2>&1; then
        python "$SCRIPT_DIR/get_plugins.py"
    else
        echo "Python is not installed. Skipping plugin fetch."
    fi
}

printf "
Ammar's Vimrc
@author: Ammar Khaku (akhaku)
Requires Vim7 compiled with ruby support for some of the ruby stuff

"
move_old_vim_files
setup_vim_softlinks
get_all_plugins
