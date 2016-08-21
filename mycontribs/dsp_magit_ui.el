;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;; magit
;;    https://github.com/magit/magit.git
;;
;; This file is supposed to be called from
;;    dontspacemacs/user-init
;; alas,
;;    configuration-layer/package-usedp
;; cannot be used.
;; **************************************************************************************

(when t
  (setq-default git-magit-status-fullscreen t)) ;; magit status in fullscreen

;; EOF
