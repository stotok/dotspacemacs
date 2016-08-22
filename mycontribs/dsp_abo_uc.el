;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;; abo-abo packages here :)
;;
;; This file is supposed to be called from
;;    dontspacemacs/user-config
;; **************************************************************************************

(when (configuration-layer/package-usedp 'ivy)
  (message "<<< user-config: ivy customization")
  ;; i don't like dir buffer. let's change :)
  (define-key ivy-minibuffer-map (kbd "RET") 'ivy-alt-done))

;; EOF
