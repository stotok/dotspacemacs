;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016-2020 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-ivy-cscope-packages
      '(
        ;; local copy of:
        ;; https://github.com/Raphus-cucullatus/ivy-cscope.el.git
        (ivy-cscope :location local)

        ;; exclude package. this will prevent the package from being installed even if
        ;; it is used by another layer
        (ggtags :excluded t)
        ))

(defun ttk-ivy-cscope/init-ivy-cscope ()
  ;;
  ;; for C/C++ install cscope:
  ;;     $ sudo apt-get install cscope
  ;;     $ cscope-indexer
  ;;
  (use-package ivy-cscope
    :init
    ;; (setq cscope-do-not-update-database t
    ;;       cscope-edit-single-match nil)
    :config
    ;;
    ;; keybinding
    (dolist (mode '(c-mode c++-mode))
      (spacemacs/declare-prefix-for-mode mode "mS" "ivy-cscope")
      (spacemacs/set-leader-keys-for-major-mode mode
        "Ss" 'ivy-cscope-find-symbol
        "Sd" 'ivy-cscope-find-definition
        "S." 'ivy-cscope-find-definition-at-point
        "Sc" 'ivy-cscope-find-caller
        "SC" 'ivy-cscope-find-callee
        "St" 'ivy-cscope-find-text
        "Se" 'ivy-cscope-find-pattern
        "Sf" 'ivy-cscope-find-file
        "Si" 'ivy-cscope-find-includer
        "S=" 'ivy-cscope-find-assignment
        ;;
        ;; "sb" 'cscope-display-buffer
        "Su" 'ivy-cscope-pop-mark
        ;; These actually xcscope command, put here as well :)
        "Sa" 'cscope-set-initial-directory
        "SA" 'cscope-unset-initial-directory
        )
      )
    ;;
    ;; let cscope minor modes key binding takes priority over evil key bindings
    ;;
    ;; (evil-make-overriding-map cscope-list-entry-keymap 'normal)
    ;; force update evil keymaps after cscope-list-entry-mode loaded
    ;; (add-hook 'cscope-list-entry-hook #'evil-normalize-keymaps)
    )
  )

;; EOF
