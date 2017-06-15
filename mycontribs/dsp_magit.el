;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016, 2017 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;****************************************************************************************
;;
;; ***************************************************************************************
;;
;; magit
;;    https://github.com/magit/magit.git
;;
;; ***************************************************************************************

(cond
 ((IsDspUserInit)
  (message "*** dsp_magit.el user init: magit customization")
  ;;
  (when t
    (setq-default git-magit-status-fullscreen t)) ;; magit status in fullscreen
  )
 )

;; EOF
