;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************

;; **************************************************************************************
;; Faces/font/eye-candy related stuff
;; This file is supposed to be called from
;;    dontspacemacs/user-init
;; alas,
;;    configuration-layer/package-usedp
;; cannot be used.
;; **************************************************************************************
;;
;; spacemacs-dark/spacemacs-light theme customization
;;
;;(when (configuration-layer/package-usedp 'spacemacs-theme)
(when t
  (message ">>> user-init: spacemacs-theme customization ...")
  (setq spacemacs-theme-comment-bg nil) ; why the heck got background :(
  (setq spacemacs-theme-org-height nil) ; don't change height of org-mode headlines
  )

;; EOF
