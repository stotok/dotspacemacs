;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-cscope-packages
      '(
        ;; local copy of cvs vanilla cscope project version 15.8a
        ;;     http://cscope.sourceforge.net/
        (xcscope :location local)

        ;; exclude package. this will prevent the package from being installed even if
        ;; it is used by another layer
        (ggtags :excluded t)
        ))

(defun ttk-cscope/init-xcscope ()
  ;; This is from stock CVS xcscope.el
  ;;
  ;; for C/C++ install cscope:
  ;;     $ sudo apt-get install cscope
  ;;     $ cscope-indexer
  ;;
  ;; for Python install pycscope:
  ;;     $ sudo pip install pycscope
  ;;     $ pycscope-indexer
  (use-package xcscope
    :init
    (setq cscope-do-not-update-database t
          cscope-edit-single-match nil)
    :config
    ;;
    ;; keybinding
    ;;
    (dolist (mode '(c-mode c++-mode python-mode))
      (spacemacs/declare-prefix-for-mode mode "ms" "cscope")
      (spacemacs/set-leader-keys-for-major-mode mode
        "ss" 'cscope-find-this-symbol
        "sd" 'cscope-find-global-definition
        "sc" 'cscope-find-functions-calling-this-function
        "sC" 'cscope-find-called-functions
        "si" 'cscope-find-files-including-file
        ;;
        "sb" 'cscope-display-buffer
        "su" 'cscope-pop-mark
        ;;
        "sa" 'cscope-set-initial-directory
        "sA" 'cscope-unset-initial-directory
        )
      )
    ;;
    ;; let cscope minor modes key binding takes priority over evil key bindings
    ;;
    (evil-make-overriding-map cscope-list-entry-keymap 'normal)
    ;; force update evil keymaps after cscope-list-entry-mode loaded
    (add-hook 'cscope-list-entry-hook #'evil-normalize-keymaps)
    )
  )

;; EOF
