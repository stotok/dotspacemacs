;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/dotspacemacs/mycontribs/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     (auto-completion :disabled-for org git)
     ;; better-defaults
     emacs-lisp
     ;; git
     c-c++
     markdown
     latex
     org-plus-contrib
     shell-scripts
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when downloading packages.
   ;; Possible values are `used', `used-but-keep-unused' and `all'. `used' will
   ;; download only explicitly used packages and remove any unused packages as
   ;; well as their dependencies. `used-but-keep-unused' will download only the
   ;; used packages but won't delete them if they become unused. `all' will
   ;; download all the packages regardless if they are used or not and packages
   ;; won't be deleted by Spacemacs. (default is `used')
   dotspacemacs-download-packages 'used))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   )
  ;;
  ;; This is based on conditional
  ;;
  (cond
   ((eq system-type 'darwin)
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '("Andale Mono"
                                 :size 12
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1))
    ) ;; end of darwin
   ((eq system-type 'gnu/linux)
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '("Inconsolata"
                                 :size 14
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1))
    ) ;; end of gnu/linux
   ((or (eq system-type 'cygwin) (eq system-type 'windows-nt))
    ;; This is to fix error when calling server start on startup
    (require 'server)
    (and (>= emacs-major-version 23)
         (defun server-ensure-safe-dir (dir) "Noop" t))
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '("Consolas"
                                 :size 12
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1))
    ) ;; end of cygwin or windows
   (t
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '("Source Code Pro"
                                 :size 13
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1))
    ) ;; end of t
   ) ;; end of conditional
  ) ;; end of dotspacemacs/init

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (when t  ;; projectile
    (setq projectile-indexing-method 'alien)
    (setq projectile-enable-caching t)
    (setq projectile-file-exists-remote-cache-expire nil)
    ;;(setq projectile-mode-line '(:eval (format " P:%s" (projectile-project-name))))
    (setq projectile-completion-system 'ivy) ; it's nice (from swiper package)
    (setq projectile-svn-command "find . -type f -not -iwholename '*.svn/*' -print0"))
  (when t  ;; org mode
    (with-eval-after-load 'org
      ;; publishing (specific for each project)
      ;;(require 'ox-publish) ;; ox-publish already install inside org-plus-contrib package
      (setq org-publish-project-alist
            '(;; TODOC project
              ("todoc-notes"
              :base-directory "~/project/todoc.org/org/"
              :base-extension "org"
              :publishing-directory "~/project/todoc.org/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("todoc-static"
              :base-directory "~/project/todoc.org/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/todoc.org/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("todoc-org" :components ("todoc-notes" "todoc-static"))
              ;; DNOTE project
              ("dnote-notes"
              :base-directory "~/project/dnote/org/"
              :base-extension "org"
              :publishing-directory "~/project/dnote/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("dnote-static"
              :base-directory "~/project/dnote/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/dnote/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("dnote-org-html-themes"
              :base-directory "~/project/org-html-themes/styles/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/dnote/bo/html/styles/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("dnote-org" :components ("dnote-notes" "dnote-static" "dnote-org-html-themes"))
              ;; omaha.org project here
              ("omaha.org-notes"
              :base-directory "~/project/omaha.org/org/"
              :base-extension "org"
              :publishing-directory "~/project/omaha.org/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("omaha.org-static"
              :base-directory "~/project/omaha.org/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/omaha.org/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("omaha.org-org-html-themes"
              :base-directory "~/project/org-html-themes/styles/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/omaha.org/bo/html/styles/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("omaha.org-org" :components ("omaha.org-notes" "omaha.org-static" "omaha.org-org-html-themes"))
              ;; SSDC project
              ("ssdc-notes"
              :base-directory "~/project/ssdc/org/"
              :base-extension "org"
              :publishing-directory "~/project/ssdc/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("ssdc-static"
              :base-directory "~/project/ssdc/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/ssdc/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("ssdc-org-html-themes"
              :base-directory "~/project/org-html-themes/styles/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/ssdc/bo/html/styles/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("ssdc-org" :components ("ssdc-notes" "ssdc-static" "ssdc-org-html-themes"))))))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; ************************************************************************************
  ;;
  ;; Here for emacs standard stuffs
  ;;
  ;; ************************************************************************************
  ;;
  ;; Enable utf coding
  ;;
  ;; disable CJK coding/encoding (chinese/japanese/korean characters)
  (setq utf-translate-cjk-mode nil)
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  ;; set the default encoding system
  (prefer-coding-system 'utf-8)
  (setq default-file-name-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  ;; backwards compatibility as default-buffer-file-coding-system
  ;; is deprecated in 23.2
  (if (boundp buffer-file-coding-system)
      (setq buffer-file-coding-system 'utf-8)
    (setq default-buffer-file-coding-system 'utf-8))
  ;; Treat clipboard input as UTF-8 string first; compound text next, etc
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
  ;; Depend on the font size, sometimes frame size cannot be maximized (there's ugly gap)
  (setq frame-resize-pixelwise t)
  ;;
  ;; Frame title bar formatting to show full path of file
  ;;
  (setq-default
   frame-title-format
   (list '((buffer-file-name " %f" (dired-directory
                                    dired-directory
                                    (refert-buffer-function " %b"
                                                            ("%b - Dir: " default-directory)))))))
  ;;
  ;; set frame size
  ;;
  (when window-system
    ;;(when nil
    ;;;; initial frame size
    ;;(setq initial-frame-alist
    ;;      '((width  .  92)                ; characters in a line
    ;;        (height .  54)))              ; number of lines
    ;;;; subsequent frame
    ;;(setq default-frame-alist
    ;;      '((width  .  90)                ; characters in a line
    ;;        (height .  52))))             ; number of lines
    ;;
    ;; set initial frame size
    ;;
    (add-to-list 'initial-frame-alist (cons 'width 92))
    ;; set initial frame height: substract a couple of hundreds pixels from
    ;; the screen height (for panels, menubars and whatnot), then devide
    ;; by the height of a char to the the height we want
    ;;  (add-to-list 'default-frame-alist
    ;;               (cons 'height (/ (- (x-display-pixel-height) 150)
    ;;                                (frame-char-height))))
    ;;
    ;; set subsequent frame size
    ;;
    (add-to-list 'default-frame-alist (cons 'width  92))
    ;;(add-to-list 'default-frame-alist (cons 'height 52))
    )
  ;;
  (setq-default indent-tabs-mode nil) ; use spaces (not tabs) for indenting
  (setq-default truncate-lines t)     ; turn on truncating long lines
  (setq require-final-newline t)      ; always add a final newline
  (set-fringe-mode '(0 . 0))          ; disable fringe, dun need it (no line wrap, etc)
  ;; vi like scrolling
  (setq scroll-step 1           ; scroll just goes down 1 line even it hits the bottom
        scroll-margin 3)        ; 3 lines margin
  ;;
  ;; ************************************************************************************
  ;;
  ;; Here for evil/spacemacs behaviour
  ;;
  ;; ************************************************************************************
  ;; Stop Cursor Creep. Does it bother you that the cursor creeps back when you
  ;; go back to normal mode? Here's how to stop it.
  ;; With this setting, command '$' in normal mode will bring cursor go pass the
  ;; end of line (just like emacs behaviour).
  (setq evil-move-cursor-back nil)
  (spacemacs/toggle-vi-tilde-fringe-off) ;; don't want tilde on empty lines
  ;; ivy-mode: well, i don't like dir buffer. let's change :)
  (define-key ivy-minibuffer-map (kbd "RET") 'ivy-alt-done)
  ;;
  ;; ************************************************************************************
  ;;
  ;; Here for package configuration
  ;;
  ;; ************************************************************************************
  (global-company-mode)            ;; enable it globally
  ;;
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
