;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;; Miscelleaneous utilities.
;; This file is supposed to be called from
;;    dontspacemacs/user-init
;; alas,
;;    configuration-layer/package-usedp
;; cannot be used.
;; **************************************************************************************
;;
;; projectile
;;     https://github.com/bbatsov/projectile.git
;;
(when t
  (message ">>> user-init: projectile customization ...")
  ;; alien method need external utility (unixes), and fast.
  ;; it ignores the content of .projectile, but read .gitignore
  (setq projectile-indexing-method 'alien)
  ;; native method is portable but slow. it reads the content of .projectile
  ;;(setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  ;; disable remote file exists cache
  (setq projectile-file-exists-remote-cache-expire nil)
  ;; change default display on modeline (don't do it for spacemacs)
  ;;(setq projectile-mode-line '(:eval (format " P:%s" (projectile-project-name))))
  (setq projectile-completion-system 'ivy) ; it's nice (from swiper package)
  ;; tell projectile to not try and find the file on the remote SVN server and
  ;; instead search locally, see https://github.com/bbatsov/projectile/issues/520
  (setq projectile-svn-command "find . -type f -not -iwholename '*.svn/*' -print0"))

;;
;; company-mode
;;     https://github.com/company-mode/company-mode.git
;;
;; Modular in-buffer completion framework (rtags need company)
(when t
  (message ">>> user-init: company customization ...")
  ;; company delay until suggestions are show
  (setq company-idle-delay 0.5)
  ;; weight by frequency
  (setq company-transformers '(company-sort-by-occurrence)))

;; EOF
