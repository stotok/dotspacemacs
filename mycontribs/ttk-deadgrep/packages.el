;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; Please install ripgrep:
;;
;; MacPort
;;     $ sudo port install ripgrep
;; Windows/Cygwin
;;     Download binary from https://github.com/dajva/rg.el

(setq ttk-deadgrep-packages
      '(
        deadgrep
        ))

(defun ttk-deadgrep/init-deadgrep ()
  ;;
  ;; deadgrep
  ;;     https://github.com/Wilfred/deadgrep
  (use-package deadgrep
    :init
    ;;
    :config
    ;;
    )
  )
