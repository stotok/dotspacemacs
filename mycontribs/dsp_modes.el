;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016-2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;; utilities for (programming modes)
;; **************************************************************************************

;;
;; tcl-mode
;;
(cond
 ((IsDspUserConfig)
  (message "*** dsp_modes.el user config: tcl-mode customization")
  ;;
  ;; to make $ not part of a symbol, hence, $ not part of dabbrev as well :)
  (with-eval-after-load "tcl"
    (modify-syntax-entry ?$ "'" tcl-mode-syntax-table))
  )
 )

;;
;; python-mode
;;
(cond
 ((IsDspUserConfig)
  (message "*** dsp_modes.el user config: python-mode customization")
  ;;
  (setq-default python-indent-offset 4)
  (setq python-shell-completion-native-enable nil)
  ;; Don't spam message buffer when python-mode can't guess indent-offset
  (setq python-indent-guess-indent-offset-verbose nil)
  )
 )

;;
;; plantuml-mode
;; Need 'dot' utility from graphviz package:
;;      $ sudo port install graphviz (macport)
;;      $ sudo apt-get install graphviz (debian)
;; then set env var:
;;      $ export GRAPHVIZ_DOT="/opt/local/bin/dot" (macport)
;;      $ export GRAPHVIZ_DOT="/usr/bin/dot" (debian)
;;
(cond
 ((IsDspUserConfig)
  (when (configuration-layer/package-usedp 'plantuml-mode)
    (message "*** dsp_modes.el user config: plantuml-mode customization")
    ;;
    (setq plantuml-jar-path "~/dotspacemacs/plantuml/plantuml.jar")
    ;; (setq plantuml-jar-path "`cygpath -w -a /cygdrive/d/DSUsers/uia53572/dotspacemacs/plantuml/plantuml.jar`")
    ;; (setq plantuml-jar-path "D:\DSUsers\uia53572\dotspacemacs\plantuml\plantuml.jar")      ; NO
    ;;
    ;; (setq plantuml-jar-path (shell-command-to-string (format "cygpath -w -a ~/dotspacemacs/plantuml/plantuml.jar")))      ; NO
    ;;;;;;;;(setq plantuml-jar-path (expand-file-name "~/dotspacemacs/plantuml/plantuml.jar"))
    ;;
    ;; (setq plantuml-jar-path "`cygpath -w -a ~/dotspacemacs/plantuml/plantuml.jar'") ; NO
    ;; (setq plantuml-jar-path (expand-file-name "`cygpath -w -a ~/dotspacemacs/plantuml/plantuml.jar`"))
    ;; (setq plantuml-jar-path (expand-file-name "`cygpath -m ~/dotspacemacs/plantuml/plantuml.jar`"))
    ;; https://github.com/skuro/plantuml-mode/issues/22
    ;; (setq plantuml-jar-path "`cygpath -w -a /cygdrive/d/DSUsers/uia53572/dotspacemacs/plantuml/plantuml.jar`")
    ;; (shell-quote-argument (convert-standard-filename plantuml-jar-path))
    ;; enable plantuml-mode for PlantUML files
    (setq auto-mode-alist (cons '("\\.plantuml$" . plantuml-mode) auto-mode-alist))
    (setq auto-mode-alist (cons '("\\.uml$"      . plantuml-mode) auto-mode-alist))
    )
  )
 )

(cond
 ((IsDspUserConfig)
  (when (configuration-layer/package-usedp 'rtags)
    (message "*** dsp_modes.el user config: rtags customization")
    (setq rtags-completions-enabled t)  ; enable completions in rtags

    ;; redefine the original rtags function, to include rtags-bury-or-delete because
    ;; i prefer to always bury RTags and all other buffers once go to the target location
    ;; (defun rtags-select-and-remove-rtags-buffer ()
    ;;   (interactive)
    ;; ;;  (rtags-bury-or-delete)
    ;;   (rtags-select t t))

    (with-eval-after-load 'rtags
      (define-key rtags-mode-map (kbd "o") 'rtags-select-and-remove-rtags-buffer)
      (define-key rtags-mode-map (kbd "q") 'rtags-call-bury-or-delete)
      ;;
      (evil-make-overriding-map rtags-mode-map 'normal)
      (add-hook 'rtags-mode-hook #'evil-normalize-keymaps))

    ;; (defconst ttk-rtags-overrides
    ;;   '(("C-]" 'rtags-find-symbol-at-point)
    ;;     ("M-." 'rtags-find-symbol-at-point)))

    ;; (defun ttk-rtags-set-evil-keys()
    ;;   (dolist (override ttk-rtags-overrides)
    ;;     (evil-local-set-key 'normal (car override) (cdr override))))

    ;; (add-hook 'c-mode-common-hook 'ttk-rtags-set-evil-keys)

    (dolist (mode '(c-mode c++-mode objc-mode))
      ;; i want it to be similar with cscope keybindings that i'm accustomed to.
      (evil-leader/set-key-for-mode mode
        "r d" 'rtags-find-symbol-at-point
        "r D" 'rtags-find-symbol
        "r c" 'rtags-find-references-at-point
        "r C" 'rtags-find-references    ; find functions call this function
        "r v" 'rtags-find-virtuals-at-point
        "r V" 'rtags-print-enum-value-at-point
        "r s" 'rtags-find-all-references-at-point ; find functions anywhere
        ;;(define-key map (kbd (concat prefix "Y")) 'rtags-cycle-overlays-on-screen)
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
        "r f" 'rtags-find-file
        ;;(define-key map (kbd (concat prefix "F")) 'rtags-fixit)
        ;;(define-key map (kbd (concat prefix "L")) 'rtags-copy-and-print-current-location)
        ;;(define-key map (kbd (concat prefix "X")) 'rtags-fix-fixit-at-point)
        ;;(define-key map (kbd (concat prefix "K")) 'rtags-make-member)
        "r j" 'rtags-imenu
        "r t" 'rtags-symbol-type
        ;;(define-key map (kbd (concat prefix "T")) 'rtags-taglist)
        "r h" 'rtags-print-class-hierarchy
        ;; "r a" 'rtags-print-source-arguments
        "r b" 'rtags-list-results
        ;; "r B" 'rtags-show-rtags-buffer
        )))))
;; EOF
