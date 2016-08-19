# dotspacemacs

My spacemacs configuration layers including the dotfile (.spacemacs).
The configuration and setting are tested with 'develop' branch of syl20bnr/spacemacs.

## Installation
Delete or backup your ~/.emacs and ~/.emacs.d/, then go to your `home` directory:

```
$ git clone https://github.com/syl20bnr/spacemacs.git .emacs.d
$ cd .emacs.d
$ git checkout -b develop -t origin/develop
$ cd ..
$ git clone https://github.com/stotok/dotspacemacs.git
$ ln -s dotspacemacs/.spacemacs .
```

## Contents

### cscope

Support c/c++ and python, script indexers can be found at mycontribs/ttk-cscope/local/xcscope.
If need to, modify them according to your code structure. My preference is to invoke the indexer at the
root directory of your source tree from the command line. So, include the script's location into your ${PATH}.
