;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; redefine the original rtags function, to include rtags-bury-or-delete because
;; i prefer to always bury RTags and all other buffers once go to the target location
(defun rtags-select-and-remove-rtags-buffer ()
  (interactive)
;;  (rtags-bury-or-delete)
  (rtags-select t t))

(define-key rtags-mode-map (kbd "o") 'rtags-select-and-remove-rtags-buffer)
(evil-make-overriding-map rtags-mode-map 'normal)
(add-hook 'rtags-mode-hook #'evil-normalize-keymaps)

;;
;;
;;

(defconst ttk-rtags-overrides
  '(("C-]" 'rtags-find-symbol-at-point)
    ("M-." 'rtags-find-symbol-at-point)))

(defun ttk-rtags-set-evil-keys()
  (dolist (override ttk-rtags-overrides)
    (evil-local-set-key 'normal (car override) (cdr override))))

(add-hook 'c-mode-common-hook 'ttk-rtags-set-evil-keys)

(dolist (mode '(c-mode c++-mode objc-mode))
  ;; i want it to be similar with cscope keybindings that i'm accustomed to.
  (evil-leader/set-key-for-mode mode
    "r d" 'rtags-find-symbol-at-point
;;    (define-key map (kbd (concat prefix "S")) 'rtags-find-references-at-point)
    ;;(define-key map (kbd (concat prefix "v")) 'rtags-find-virtuals-at-point)
    ;;(define-key map (kbd (concat prefix "V")) 'rtags-print-enum-value-at-point)
    "r s" 'rtags-find-all-references-at-point
    ;;(define-key map (kbd (concat prefix "Y")) 'rtags-cycle-overlays-on-screen)
    ;;(define-key map (kbd (concat prefix ">")) 'rtags-find-symbol)
    ;;(define-key map (kbd (concat prefix "<")) 'rtags-find-references)
    "r u" 'rtags-location-stack-back
    ;;(define-key map (kbd (concat prefix "]")) 'rtags-location-stack-forward)
    ;;(define-key map (kbd (concat prefix "D")) 'rtags-diagnostics)
    ;;(define-key map (kbd (concat prefix "C")) 'rtags-compile-file)
    ;;(define-key map (kbd (concat prefix "G")) 'rtags-guess-function-at-point)
    ;;(define-key map (kbd (concat prefix "p")) 'rtags-dependency-tree)
    ;;(define-key map (kbd (concat prefix "P")) 'rtags-dependency-tree-all)
    ;;(define-key map (kbd (concat prefix "e")) 'rtags-reparse-file)
    ;;(define-key map (kbd (concat prefix "E")) 'rtags-preprocess-file)
    ;;(define-key map (kbd (concat prefix "R")) 'rtags-rename-symbol)
    ;;(define-key map (kbd (concat prefix "M")) 'rtags-symbol-info)
    ;;(define-key map (kbd (concat prefix "U")) 'rtags-display-summary-as-message)
    ;;(define-key map (kbd (concat prefix "S")) 'rtags-display-summary)
    ;;(define-key map (kbd (concat prefix "O")) 'rtags-goto-offset)
    ;;(define-key map (kbd (concat prefix ";")) 'rtags-find-file)
    ;;(define-key map (kbd (concat prefix "F")) 'rtags-fixit)
    ;;(define-key map (kbd (concat prefix "L")) 'rtags-copy-and-print-current-location)
    ;;(define-key map (kbd (concat prefix "X")) 'rtags-fix-fixit-at-point)
    "r B" 'rtags-show-rtags-buffer
    ;;(define-key map (kbd (concat prefix "K")) 'rtags-make-member)
    ;;(define-key map (kbd (concat prefix "I")) 'rtags-imenu)
    ;;(define-key map (kbd (concat prefix "T")) 'rtags-taglist)
    ;;(define-key map (kbd (concat prefix "h")) 'rtags-print-class-hierarchy)
    ;;(define-key map (kbd (concat prefix "a")) 'rtags-print-source-arguments)
    "r b" 'rtags-list-results
    ))

(provide 'keybindings)

;; EOF
