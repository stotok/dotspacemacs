;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016, 2017 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;****************************************************************************************
;;
;; ***************************************************************************************
;;
;; Here for emacs standard stuffs (no external package)
;;
;; ***************************************************************************************
(cond
 ((IsDspUserInit)
  ;; ************************************************************************************
  ;; This section is supposed to be called from
  ;;    dontspacemacs/user-init
  ;; alas,
  ;;    configuration-layer/package-usedp
  ;; cannot be used.
  ;; ************************************************************************************
  (message "*** dsp_std.el: user init")
  ;;
  ;;
  ;; Keyboard Remap
  ;;
  (when (IsOSX)
    ;; 1) Mac build-in Keyboard & Mouse preference:
    ;;    - Swap [CapsLock] and [Control]
    ;;
    ;; 2) KeyRemap4MacBook:
    ;;    - Map [Option_R] to [Control_R] (only in Emacs, Terminal, X11)
    ;;    Note: This KeyRemap4MacBook no need anymore because I can remap
    ;;          option to control using mac-option-modifier below ...
    ;;
    ;; 3) Then below:
    ;;
    ;;    See https://emacsformacosx.com/tips
    ;;    Here's variables controlling the modifier keys:
    ;;
    ;;    - ns-alternate-modifier
    ;;    - ns-command-modifier
    ;;    - ns-control-modifier
    ;;    - ns-function-modifier
    ;;    - ns-option-modifier (just a different name for ns-alternate-modifier)
    ;;    - ns-right-alternate-modifier
    ;;    - ns-right-command-modifier
    ;;    - ns-right-control-modifier
    ;;    - ns-right-option-modifier
    ;;
    ;;    Each variable can be set to 'control, 'meta, 'alt, 'super, or 'hyper.
    ;;
    ;;    In addition ns-alternative-modifier (and ns-option-modifier) can be set to 'none,
    ;;    which lets it get interpreted by the OS so it can be used to input special
    ;;    characters.
    ;;
    ;;    The ns-right-* variables are set to 'left by default which makes them the same as
    ;;    their left counterpart.
    (setq mac-command-modifier 'meta)    ; [Command] behaves like [Meta]
    (setq mac-option-modifier 'control)) ; [Option] behaves like [Control]
  )
 ((IsDspUserConfig)
  ;; *************************************************************************************
  ;; This section is supposed to be called from
  ;;    dontspacemacs/user-config
  ;; can be checked against:
  ;;    configuration-layer/package-usedp
  ;; *************************************************************************************
  (message "*** dsp_std.el: user config")
  ;;
  ;; detaching the custom-file
  ;; to put the customazation elisp from UI "M-x customize" at the separate file
  ;; rather than at the end of your .emacs (default behaviour)
  (setq custom-file "~/dotspacemacs/private/custom.el") ; redirect to custom.el
  (when nil                           ; t if u want to load custom.el now
    (load custom-file 'noerror))      ; dun display error if no custom.el
  ;;
  ;;
  ;; my work source files contain asm code in *.a, however, standard emacs exclude
  ;; *.a, hence, here to remove *.a from exclusion.
  ;; how to do:
  ;;   M-x customize-variable <RET> completion-ignored-extensions <RET>
  ;; and get the result from ~/.emacs.d/custom.el, then, copy here :)
  ;; Here's the list for my own supposed to be ignored files extension:
  ;; 1. *.orig
  ;;    It is from 'hg revert'.
  ;; 2. #*# --> # (e.g. #my.emacs#)
  ;;    It is from emacs backup (??)
  ;; 3. .DS_Store
  ;;    OSX blah file I never intend to see it
  (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(completion-ignored-extensions (quote (".o" "~" ".bin" ".bak" ".obj" ".map" ".ico" ".pif" ".lnk" ".ln" ".blg" ".bbl" ".dll" ".drv" ".vxd" ".386" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".orig" "#" ".DS_Store"))))
  ;;
  ;;
  ;; By default emacs saves backup files under the original name with a tilde `~`
  ;; appended. This is primitive and boring. Civilized people want to version
  ;; their backups and organize it so that backups are not located out through
  ;; their harddrive, but rather organized into specific backup directories.
  ;; backup-dir.el
  (when t                             ; this is built-in emacs functions
    (setq backup-directory-alist `((".*" . ,"~/dotspacemacs/private/.backupb/"))         ; this is for auto backup ~filename
          auto-save-file-name-transforms `((".*" ,"~/dotspacemacs/private/.backupb/" t)) ; this is for auto-save #filename#
          backup-by-copying t         ; don't clobber symlinks
          delete-old-versions t       ;
          kept-new-versions 6         ;
          kept-old-verions 2          ;
          version-control t           ;
          ))
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
  ;;
  ;;
  ;; etc
  ;;
  (setq vc-follow-symlinks t) ; don't ask for confirmation for opening symlinked file
  ;;
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
  (setq-default indent-tabs-mode nil) ; use spaces (not tabs) for indenting
  (setq-default truncate-lines t)     ; turn on truncating long lines
  (setq require-final-newline t)      ; always add a final newline
  (set-fringe-mode '(0 . 0))          ; disable fringe, dun need it (no line wrap, etc)
  ;; i dun want horizontal window splitting
  ;; and i want only vertical window splitting
  (setq split-height-threshold 0)
  (setq split-width-threshold nil)
  ;; vi like scrolling
  (setq scroll-step 1           ; scroll just goes down 1 line even it hits the bottom
        scroll-margin 3)        ; 3 lines margin
  ;;
  (setq delete-by-moving-to-trash nil) ;; no need to go to OS's trash folder
  (when (or (IsCygwin) (IsWindows))
    ;; try to improve slow performance on windows and cygwin
    (setq w32-get-true-file-attributes nil))
  ;;
  ;; Hightlighting matching parens, etc
  ;;
  (when nil ; too noisy, seems spacemacs no need this
    (setq show-paren-delay 0)    ; how long to wait?
    (show-paren-mode t)          ; hightlight matching parens, etc
    ;; available are:
    ;; - parentheses: hightlight character, not expression
    ;; - expression : whole expression is highlighted
    ;; - mixed      : mixed
    (setq show-paren-style 'mixed))
  ;;
  ;; dabbrev-expand mode: M-/
  ;;
  ;; to make sure case is preserved when expanding
  (setq dabbrev-case-replace nil)
  ;;
  ;;
  ;; bookmarks
  ;;
  ;;(setq bookmark-default-file '   )      ; default is ~/.emacs.bmk
  (setq bookmark-save-flag 1)             ; how many mods between saves
  ;;
  ;; turn-on automatic bracket insertion by pairs. New in emacs 24
  ;;
  (when nil                          ; Aha!!! on spacemacs it add weird blank line
    (electric-pair-mode t)
    ;; make electric-pair-mode work on more brackets
    ;; e.g. curly bracket {} isn't auto-closed when in emacs-lisp-mode
    (setq electric-pair-pairs '(
                                (?\" . ?\")
                                (?\{ . ?\})
                                ))
    ;; LaTeX-mode
    (add-hook 'LaTeX-mode-hook
              '(lambda ()
                  ;; removes TeX-insert-dollar binding to $ and somehow (electric-pair-mode)
                  ;; takes over and realises that $ is a bracket in this context.
                  ;; http://tex.stackexchange.com/questions/75697/auctex-how-to-cause-math-mode-dollars-to-be-closed-automatically-with-electric
                  (define-key LaTeX-mode-map (kbd "$") 'self-insert-command))))
  ;;
  ;; which-function-mode
  ;;
  (when t
    ;;
    ;; Select for all or certain modes
    ;;
    (if nil
        (which-function-mode 1) ; enable for all modes
      (progn                    ; enable for certain modes
        (require 'which-func)
        (add-to-list 'which-func-modes 'c-mode)
        (add-to-list 'which-func-modes 'cc-mode)
        (add-to-list 'which-func-modes 'c++-mode)
        (add-to-list 'which-func-modes 'java-mode)
        (add-to-list 'which-func-modes 'org-mode)
        (add-to-list 'which-func-modes 'python-mode)
        (which-func-mode 1)))
    ;;
    ;; Display it in emacs header line
    ;;
    (when nil ;; does not work in spacemacs
      (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                              mode-line-misc-info) mode-line-misc-info)
            which-func-header-line-format '(which-func-mode ("" which-func-format)))
      (defadvice which-func-ff-hook (after header-line activate)
        (when which-func-mode
          (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                                  mode-line-misc-info) mode-line-misc-info)
                header-line-format which-func-header-line-format)))))
  ;;
  ;; i dun wan mouse in emacs :)
  ;;
  (when t
    ;; i dun want mouse cursor appear on emacs
    ;;(mouse-avoidance-mode 'banish)
    ;; disable mouse wheel (and two finger swipe) scrolling
    (mouse-wheel-mode  -1)
    (global-set-key [wheel-up] 'ignore)
    (global-set-key [wheel-down] 'ignore)
    (global-set-key [double-wheel-up] 'ignore)
    (global-set-key [double-wheel-down] 'ignore)
    (global-set-key [triple-wheel-up] 'ignore)
    (global-set-key [triple-wheel-down] 'ignore)
    ;; disable mouse clicks
    (global-unset-key (kbd "<down-mouse-1>"))
    (global-unset-key (kbd "<mouse-1>"))
    (global-unset-key (kbd "<down-mouse-3>"))
    (global-unset-key (kbd "<mouse-3>")))
  ;;
  ;;
  ;; Touchpad off/on:
  ;;    switch touchpad off when emacs gets focus and on again when she loses focus
  ;;
  ;; First, install 'synclient' in linux. For other OSes, dunno yet :)
  ;; Link: https://www.reddit.com/r/emacs/comments/38o0tr/i_have_to_share_this_switch_your_touchpad_off/
  ;;
  (when nil
  (cond
   ((and (IsGNULinux) (IsFrodo))
    (message "    >>> turn-off trackpad")
    (defun turn-off-mouse (&optional frame)
      (interactive)
      (let ((inhibit-message t) (default-directory "~"))
        (shell-command "synclient TouchpadOff=1")))
    ;;
    (defun turn-on-mouse (&optional frame)
      (interactive)
      (let ((inhibit-message t) (default-directory "~"))
        (shell-command "synclient TouchpadOff=0")))
    ;;
    (add-hook 'focus-in-hook #'turn-off-mouse)
    (add-hook 'focus-out-hook #'turn-on-mouse)
    (add-hook 'delete-frame-functions #'turn-on-mouse)
    (add-hook 'kill-emacs-hook #'turn-on-mouse)
    )
  ))
  ;;
  ;; TRAMP
  ;;
  ;; SSH WITH PUBLIC KEY
  ;; 1. Add to ~/.ssh/config
  ;;        Host myhost
  ;;             Hostname myhost.abc.com
  ;;             ... <as usual>
  ;;             IdentityFile ~/.ssh/id_rsa_yours_blah
  ;; 2. $ eval `ssh-agent -s`
  ;; 3. $ ssh-add ~/.ssh/id_rsa_blah
  ;; 4. From emacs:
  ;;        C-x C-f /ssh:yourusername@myhost:~/somefile.txt
  ;;
  (require 'tramp)
  (tramp-set-completion-function "ssh"
                                '((tramp-parse-sconfig "/etc/ssh_config")
                                  (tramp-parse-sconfig "~/.ssh/config")))
  (setq tramp-default-method "ssh")
  ;;
  ;; setup for rgrep.el
  ;;     https://github.com/magnars/.emacs.d/blob/master/settings/setup-rgrep.el
  (when t
    (defun rgrep-goto-file-and-close-rgrep ()
      (interactive)
      (compile-goto-error)
      ;;(kill-buffer "*grep*") ;; dun kill it, sometimes i wanna go back again
      (delete-other-windows)
      (message "M-x rgrep-display-buffer to return to grep buffer."))
    (defun rgrep-display-buffer ()
      "Display the *grep* buffer."
      (interactive)
      (let ((buffer (get-buffer "*grep*")))
        (if buffer
            (pop-to-buffer buffer)
          (error "The *grep* buffer does not exist yet"))))
    (eval-after-load "grep"
      '(progn
        ;;
        ;; Don't recurse into some directories
        ;(add-to-list 'grep-find-ignored-directories "target")
        ;(add-to-list 'grep-find-ignored-directories "node_modules")
        ;;
        ;; add custom keybindings
        (when nil                        ; spacemacs does not need these :)
          (define-key grep-mode-map (kbd "j") 'next-line)
          (define-key grep-mode-map (kbd "k") 'previous-line))
        (define-key grep-mode-map (kbd "o") 'rgrep-goto-file-and-close-rgrep))))
  ;;
  ;; ************************************************************************************
  ;;
  ;; Here for evil/spacemacs behaviour
  ;;
  ;; ************************************************************************************
  (setq-default spacemacs-show-trailing-whitespace t ; i like it :) It's default behaviour anyway
                ;; Stop Cursor Creep. Does it bother you that the cursor creeps back when you
                ;; go back to normal mode? Here's how to stop it.
                ;; With this setting, command '$' in normal mode will bring cursor go pass the
                ;; end of line (just like emacs behaviour).
                ;; Wait ... I think cursor creep is the way to go. Keep it creep :) Well ,,,
                evil-move-cursor-back t
                ;;
                ;; change escape keybinding from almost anything to normal state
                ;; well, just use Ctrl-[ now ... "fd" causing unconfortable experience :(
                ;; evil-escape-key-sequence "fd"  ; default Ctrl-[ is still working
                ;; evil-escape-delay 0.3          ; make it a bit longer for the combination key
                ;; evil-escape-unordered-key-sequence t ; just press 'j' and 'k' together lah :)
                )
  (spacemacs/toggle-vi-tilde-fringe-off)    ;; tilde on empty lines
  ;;
  ;; modeline related
  ;;
  (when t
    (spaceline-toggle-buffer-size-off)     ; display buffer size
    (spaceline-toggle-buffer-position-off) ; buffer position info
    (spaceline-toggle-hud-off)             ; hud indicator (right bottom)
    (spaceline-toggle-window-number-off)   ; window number (left bottom 2)
    (spaceline-toggle-minor-modes-off)     ; well, no need to show liao ...
    (when (IsOSX)
      (setq ns-use-srgb-colorspace nil)    ; to fix broken separator color
      )
    )
  )
 )

;; EOF
