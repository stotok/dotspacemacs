;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016, 2017, 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;;
;; Miscelleaneous utilities.
;;
;; **************************************************************************************

;;
;; projectile
;;     https://github.com/bbatsov/projectile.git
;;
(cond
 ((IsDspUserInit)
  (message "*** dsp_etc.el user init: projectile customization")
  )
 ((IsDspUserConfig)
  (when (configuration-layer/package-usedp 'projectile)
    (message "*** dsp_etc.el user config: projectile customization")
    ;; alien method need external utility (unixes), and fast.
    ;; it ignores the content of .projectile, but read .gitignore
    (setq projectile-indexing-method 'alien)
    ;; native method is portable but slow. it reads the content of .projectile
    ;;(setq projectile-indexing-method 'native)
    (setq projectile-enable-caching t)
    ;; disable remote file exists cache
    ;;(setq projectile-file-exists-remote-cache-expire nil)
    ;; enable remote file exists cache 10 minutes
    (setq projectile-file-exists-remote-cache-expire (* 10 60))
    ;; change default display on modeline (don't do it for spacemacs)
    ;;(setq projectile-mode-line '(:eval (format " P:%s" (projectile-project-name))))
    (setq projectile-completion-system 'ivy) ; it's nice (from swiper package)
    ;; tell projectile to not try and find the file on the remote SVN server and
    ;; instead search locally, see https://github.com/bbatsov/projectile/issues/520
    (setq projectile-svn-command "find . -type f -not -iwholename '*.svn/*' -print0")
    ;;
    ;; A list of files considered to mark the root of a project.
    ;; The bottommost (parentmost) match has precedence."
    (setq projectile-project-root-files-bottom-up
      '(".projectile" ; projectile project marker
        ".git"        ; Git VCS root dir
        ".hg"         ; Mercurial VCS root dir
        ".fslckout"   ; Fossil VCS root dir
        "_FOSSIL_"    ; Fossil VCS root DB on Windows
        ".bzr"        ; Bazaar VCS root dir
        "_darcs"      ; Darcs VCS root dir
        ".repo"       ; my VCS root dir
        ))
    ;; tramp-mode and projectile does not play well together, it is because the projectile
    ;; tries to retrieve project name this is slow on remote host.
    ;; so let's make projectile modeline only displays static string and won't slow you down
    (add-hook 'find-file-hook
              (lambda ()
                (when (file-remote-p default-directory)
                  (setq-local projectile-mode-line "P:remote")))))
  )
 )

;;
;; company-mode
;;     https://github.com/company-mode/company-mode.git
;;
;; Modular in-buffer completion framework (rtags need company)
(cond
 ((IsDspUserInit)
  (message "*** dsp_etc.el user init: company customization")
  ;;
  (when t
    ;; company delay until suggestions are show
    (setq company-idle-delay 0.5)
    ;; weight by frequency
    (setq company-transformers '(company-sort-by-occurrence)))
  )
 ((IsDspUserConfig)
  (when (configuration-layer/package-usedp 'company)
    (message "*** dsp_etc.el user config: company customization")
    ;; this will enable company-mode in all buffers
    (message "*** dsp_etc.el user config: global company mode enabled")
    (global-company-mode t))
  )
 )

;; EOF
