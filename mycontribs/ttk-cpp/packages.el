;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;

(setq ttk-cpp-packages
      '(
        ;; nothing, c-mode is default in emacs
        ))

(defun ttk-cpp/init-cpp ()
  (use-package rg
    :init
    ;;
    :config
    ;;
    (defconst my-c-style
      '((c-tab-always-indent        . t)
        (c-comment-only-line-offset . 0) ;; 4
        (c-hanging-braces-alist     . ((substatement-open after)
                                      (brace-list-open)))
        (c-hanging-colons-alist     . ((member-init-intro before)
                                      (inher-intro)
                                      (case-label after)
                                      (label after)
                                      (access-label after)))
        (c-cleanup-list             . (scope-operator
                                      empty-defun-braces
                                      defun-close-semi))
        (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                      (substatement-open . 0)
                                      (case-label        . 3) ;; 0 ;; 4
                                      (block-open        . 0)
                                      (knr-argdecl-intro . -)))
        (c-echo-syntactic-information-p . t))
      "My C Programming Style")
    ;;
    (defconst my-c-style-2
      '(;; gnu        : coding style blessed by FSF for C code in  GNU programs
        ;; stroustrup : the classic Stroustrup style for C++ code.
        ;; linux      : C coding standard for Linux (the kernel).
        ;; user       : special style created by you. It consists of the factory defaults for
        ;;              all the style variables as modified by the customizations.
        (setq c-default-style '((java-mode . "java")
                                (awk-mode  . "awk")
                                (c-mode    . "user")
                                (c++-mode  . "user")
                                (other     . "user")))
        ;; this is for linux kernel and driver project
        (c-set-style (if (and (buffer-file-name)
                              (string-match "~/project/linux" (buffer-file-name)))
                        "linux"
                      "user"))
        (c-tab-always-indent        . t)
        (c-comment-only-line-offset . 0) ;; 4
        (c-hanging-braces-alist     . ((substatement-open after)
                                      (brace-list-open)))
        (c-hanging-colons-alist     . ((member-init-intro before)
                                      (inher-intro)
                                      (case-label after)
                                      (label after)
                                      (access-label after)))
        (c-cleanup-list             . (scope-operator
                                      empty-defun-braces
                                      defun-close-semi))
        (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                      (substatement-open . 0)
                                      (case-label        . 3) ;; 0 ;; 4
                                      (block-open        . 0)
                                      (knr-argdecl-intro . -)))
        (c-echo-syntactic-information-p . t))
      "My C Programming Style 2")
    ;;
    (defconst om-c-style
      '((c-basic-offset                    . 4)
        ;; anyway, below is the default
        ;; (c-comment-prefix-regexp           . set-from-style)
        (c-default-style                   . ((c-mode    . "user")
                                              (c++-mode  . "user")
                                              (java-mode . "java")
                                              (awk-mode  . "awk")
                                              (other     . "gnu")))
        (c-indent-comments-syntactically-p . t)
        (c-offsets-alist                   . ((inline-open       . 0)
                                              (substatement-open . 0)
                                              (case-label        . +)
                                              (arglist-close     . 0)
                                              (cpp-macro         . -)))
        (c-tab-always-indent               . nil)
        (comment-column                    . 72)
        (indent-tabs-mode                  . nil)
        ;(which-func-maxout                 . 0)
        ;(which-function-mode               . t)
        )
      "OM C Programming Style")
    ;;
    (defconst sb-c-style
      '((c-basic-offset                    . 4)
        (tab-width                         . 4)
        (c-indent-level                    . 4)
        ;; anyway, below is the default
        ;; (c-comment-prefix-regexp           . set-from-style)
        (c-default-style                   . ((c-mode    . "user")
                                              (c++-mode  . "user")
                                              (java-mode . "java")
                                              (awk-mode  . "awk")
                                              (other     . "gnu")))
        (c-indent-comments-syntactically-p . t)
        (c-offsets-alist                   . ((inline-open       . 0)
                                              (substatement-open . 0)
                                              (case-label        . 0)
                                              (arglist-close     . 0)
                                              (cpp-macro         . -)))
        (c-tab-always-indent               . nil)
        (comment-column                    . 72)
        (indent-tabs-mode                  . nil)
        ;(which-func-maxout                 . 0)
        ;(which-function-mode               . t)
        )
      "SB C Programming Style")
    ;;
    (defconst ct-c-style
      '(;; gnu        : coding style blessed by FSF for C code in  GNU programs
        ;; stroustrup : the classic Stroustrup style for C++ code.
        ;; linux      : C coding standard for Linux (the kernel).
        ;; user       : special style created by you. It consists of the factory defaults for
        ;;              all the style variables as modified by the customizations.
        (setq c-default-style '((java-mode . "java")
                                (awk-mode  . "awk")
                                (c-mode    . "user")
                                (c++-mode  . "user")
                                (other     . "user")))
        ;; this is for linux kernel and driver project
        (c-set-style (if (and (buffer-file-name)
                              (string-match "~/project/linux" (buffer-file-name)))
                        "linux"
                      "user"))
        (c-tab-always-indent        . t)
        (c-comment-only-line-offset . 0) ;; 4
        (c-hanging-braces-alist     . ((substatement-open after)
                                      (brace-list-open)))
        (c-hanging-colons-alist     . ((member-init-intro before)
                                      (inher-intro)
                                      (case-label after)
                                      (label after)
                                      (access-label after)))
        (c-cleanup-list             . (scope-operator
                                      empty-defun-braces
                                      defun-close-semi))
        (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                      (substatement-open . 0)
                                      (case-label        . 4) ;; 0 ;; 3
                                      (block-open        . 0)
                                      (knr-argdecl-intro . -)))
        (c-echo-syntactic-information-p . t))
      "CT C Programming Style")
    ;;
    ;; offset customizations not in my-c-style
    ;(setq c-offsets-alist '((member-init-intro . ++)))
    ;;
    ;; Customizations for all of modes in CC mode
    ;;
    ;; my-c-mode hook
    (defun my-c-mode-common-hook ()
      ;; add my personal style and set it for the current buffer
      (c-add-style "PERSONAL" my-c-style t)
      ;; offset customizations not in my-c-style
      (c-set-offset 'member-init-intro '++)
      ;; other customizations
      (setq tab-width 3
            c-basic-offset 3
            c-indent-level 3
            indent-tabs-mode nil ; nil uses space, t uses tab
            )
      ;; we like auto-newline and hungry-delete
      ;; (c-toggle-auto-hungry-state 1)
      ;; keybindings for all supported languages.  We can put these in
      ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
      ;; java-mode-map, and idl-mode-map inherit from it.
      (define-key c-mode-base-map "\C-m" 'newline-and-indent)
      )
    ;; my-c-mode-2 hook
    (defun my-c-mode-2-common-hook ()
      ;; add my personal style and set it for the current buffer
      (c-add-style "PERSONAL2" my-c-style-2 t)
      ;; offset customizations not in my-c-style
      (c-set-offset 'member-init-intro '++)
      ;; treat '_' as a word constituent
      (modify-syntax-entry ?_ "w")
      ;; local binding
      (local-set-key (kbd "C-,") 'c-up-conditional-with-else)
      (local-set-key (kbd "C-.") '(lambda (count) (interactive "p") (c-up-conditional-with-else (- count))))
      ;; other customizations
      (setq tab-width 4
            c-basic-offset 4
            c-indent-level 4
            indent-tabs-mode nil ; nil uses space, t uses tab
            )
      ;; we like auto-newline and hungry-delete
      ;; (c-toggle-auto-hungry-state 1)
      ;; keybindings for all supported languages.  We can put these in
      ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
      ;; java-mode-map, and idl-mode-map inherit from it.
      (define-key c-mode-base-map "\C-m" 'newline-and-indent)
      )
    ;; om hook
    (defun om-c-mode-common-hook ()
      (c-add-style "OM" om-c-style t)
      ;; treat '_' as a word constituent
      (modify-syntax-entry ?_ "w")
      ;; local binding
      (local-set-key (kbd "C-,") 'c-up-conditional-with-else)
      (local-set-key (kbd "C-.") '(lambda (count) (interactive "p") (c-up-conditional-with-else (- count))))
      )
    ;; sb hook
    (defun sb-c-mode-common-hook ()
      (c-add-style "SB" sb-c-style t)
      ;; treat '_' as a word constituent
      ;;(modify-syntax-entry ?_ "w")
      ;; local binding
      (local-set-key (kbd "C-,") 'c-up-conditional-with-else)
      (local-set-key (kbd "C-.") '(lambda (count) (interactive "p") (c-up-conditional-with-else (- count))))
      )
    ;; ct hook
    (defun ct-c-mode-common-hook ()
      ;; add ct style and set it for the current buffer
      (c-add-style "CT" ct-c-style t)
      ;; offset customizations not in ct-c-style
      (c-set-offset 'member-init-intro '++)
      ;; treat '_' as a word constituent
      (modify-syntax-entry ?_ "w")
      ;; local binding
      ;; (local-set-key (kbd "C-<") 'c-up-conditional-with-else)
      ;; (local-set-key (kbd "C->") '(lambda (count) (interactive "p") (c-up-conditional-with-else (- count))))
      ;; other customizations
      (setq tab-width 4
            c-basic-offset 4
            c-indent-level 4
            indent-tabs-mode nil ; nil uses space, t uses tab
            )
      ;; we like auto-newline and hungry-delete
      ;; (c-toggle-auto-hungry-state 1)
      ;; keybindings for all supported languages.  We can put these in
      ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
      ;; java-mode-map, and idl-mode-map inherit from it.
      ;; (define-key c-mode-base-map "\C-m" 'newline-and-indent)
      )
    ;;
    ;; apply which one to use
    (add-hook 'c-mode-common-hook 'ct-c-mode-common-hook)
    ;; files *.ipp is c++ source code in UPA
    (setq auto-mode-alist (cons '("\\.ipp$" . c++-mode) auto-mode-alist))
    )
  )
