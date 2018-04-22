;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; Please install ripgrep:
;;
;; MacPort
;;     $ sudo port install ripgrep

(setq ttk-rg-packages
      '(
        rg
        ))

(defun ttk-rg/init-rg ()
  ;;
  ;; rg
  ;;     https://github.com/dajva/rg.el
  (use-package rg
    :init
    ;;
    :config
    (rg-enable-default-bindings (kbd "C-c s"))
    )
  )
