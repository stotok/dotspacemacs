;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; keybinding
;; see: https://www.gnu.org/software/emacs/manual/html_node/ccmode/Movement-Commands.html
;;
;; group:
;; - movement commands
;; - indentation commands
;; - comment commands
;; - subword commands
;; - other commnads

(dolist (mode '(c-mode c++-mode))
  (spacemacs/declare-prefix-for-mode mode "mc" "cc-mode")
  (spacemacs/set-leader-keys-for-major-mode mode
    "c<" 'c-up-conditional-with-else
    "c>" '(lambda (count) (interactive "p") (c-up-conditional-with-else (- count)))
    "cA" 'c-beginning-of-defun
    "cE" 'c-end-of-defun
    "ca" 'c-beginning-of-statement
    "ce" 'c-end-of-statement
    )
  )
;;
;; let cscope minor modes key binding takes priority over evil key bindings
;;
;; (evil-make-overriding-map cscope-list-entry-keymap 'normal)
;; force update evil keymaps after cscope-list-entry-mode loaded
;; (add-hook 'cscope-list-entry-hook #'evil-normalize-keymaps)
