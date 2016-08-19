# dotspacemacs

My spacemacs configuration layers including the dotfile (.spacemacs).
The configuration and setting are tested with 'develop' branch of syl20bnr/spacemacs.

## Installation
Delete or backup your ~/.emacs and ~/.emacs.d/, then go to your home directory:

1. $ git clone https://github.com/syl20bnr/spacemacs.git .emacs.d
2. $ cd .emacs.d
3. $ git checkout -b develop -t origin/develop
4. $ cd ..
4. $ git clone https://github.com/stotok/dotspacemacs.git
5. $ ln -s dotspacemacs/.spacemacs .

## Contents

### cscope

Support c/c++ and python codes, and the script indexers can be found at mycontribs/ttk-cscope/local/xcscope.
If need to, modify them according to your code structure. My preference is to invoke the indexer at the
root directory of your source tree at the command line. So, set the script's location at your ${PATH}.
