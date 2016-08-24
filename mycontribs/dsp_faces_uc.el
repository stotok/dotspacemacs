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
;;    dontspacemacs/user-config
;; **************************************************************************************
;;

;;
;; rainbow-delimiters
;;     https://github.com/Fanael/rainbow-delimiters.git
;;
;; balanced and colorful delimiters
;; https://github.com/Fanael/rainbow-delimiters
;;
;; Toggle single buffer: M-x rainbow-delimiters-mode
(when (configuration-layer/package-usedp 'rainbow-delimiters) ; see if it's slow on large files
  (message "<<< user-config: rainbow-deliminers-mode customization ...")
  (if nil  ; only on certain mode
      (progn
        (add-hook 'c-mode-common-hook #'rainbow-delimiters-mode)
        (setq-default frame-background-mode 'dark))
    (progn ; on most programming modes (emacs 24 and above)
      (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))))

;; EOF
