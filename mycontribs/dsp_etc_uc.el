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
;;    dontspacemacs/user-config
;; **************************************************************************************
;;
;; projectile
;;     https://github.com/bbatsov/projectile.git
;;
(when (configuration-layer/package-usedp 'projectile)
  (message "<<< user-config: projectile customization ...")
  ;; tramp-mode and projectile does not play well together, it is because the projectile
  ;; tries to retrieve project name this is slow on remote host.
  ;; so let's make projectile modeline only displays static string and won't slow you down
  (add-hook 'find-file-hook
            (lambda ()
              (when (file-remote-p default-directory)
                (setq-local projectile-mode-line "P:remote")))))

;;
;; company-mode
;;     https://github.com/company-mode/company-mode.git
;;
;; Modular in-buffer completion framework (rtags need company)
(when (configuration-layer/package-usedp 'company)
  (message "<<< user-config: company customization ...")
  ;; this will enable company-mode in all buffers
  (global-company-mode t))

;; EOF
