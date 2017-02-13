## Installation:

If using RVM, you'll want to do

    rvm use system

Before installing!

    yum -y install make ruby ruby-devel vim
    mkdir ~/.vim
    git clone git://github.com/rbowden91/vimrc.git ~/.vim
    ln -s ~/.vim/.vimrc ~/.vimrc
    vim +BundleInstall +qall

## Shortcuts

* `,n`: Toggle NERDTree
* `,t`: Show Command-T
* `,w`: Remove whitespace at end of lines
* `,g`: Toggle UNDO tree
