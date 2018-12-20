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
    ;; totok 11-nov-2018: new method by default: turbo-alien
    ;; (setq projectile-indexing-method 'alien) ; long live 'ripgrep'
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
    ;; totok 11-nov-2018: disable first
    ;; (setq projectile-project-root-files-bottom-up
    ;;   '(".projectile" ; projectile project marker
    ;;     ".git"        ; Git VCS root dir
    ;;     ".hg"         ; Mercurial VCS root dir
    ;;     ".fslckout"   ; Fossil VCS root dir
    ;;     "_FOSSIL_"    ; Fossil VCS root DB on Windows
    ;;     ".bzr"        ; Bazaar VCS root dir
    ;;     "_darcs"      ; Darcs VCS root dir
    ;;     ".repo"       ; my VCS root dir
    ;;     ))
    ;;
    ;; Use ripgrep to index files to be used by projectile
    ;; See: https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile/16499
    ;;
    ;; Default rg arguments
    ;; https://github.com/BurntSushi/ripgrep
    ;; (when (executable-find "rg")
    ;;   (message "Projectile use rg to generate project files.")
    ;;   (progn
    ;;     (defconst modi/rg-arguments
    ;;       `("--line-number"                     ; line numbers
    ;;         "--smart-case"
    ;;         "--follow"                          ; follow symlinks
    ;;         "--mmap")                           ; apply memory map optimization when possible
    ;;       "Default rg arguments used in the functions in `projectile' package.")
    ;;     ;;
    ;;     (defun modi/advice-projectile-use-rg ()
    ;;       "Always use `rg' for getting a list of all files in the project."
    ;;       (mapconcat 'identity
    ;;                 (append '("\\rg") ; used unaliased version of `rg': \rg
    ;;                         modi/rg-arguments
    ;;                         '("--null" ; output null separated results,
    ;;                           "--path-separator /" ; use forward slash (for cygwin)
    ;;                           "--files")) ; get file names matching the regex '' (all files)
    ;;                 " "))
    ;;     (advice-add 'projectile-get-ext-command :override #'modi/advice-projectile-use-rg)))
    ;;
    ;; tramp-mode and projectile does not play well together, it is because the projectile
    ;; tries to retrieve project name this is slow on remote host.
    ;; so let's make projectile modeline only displays static string and won't slow you down
    (add-hook 'find-file-hook
              (lambda ()
                (when (file-remote-p default-directory)
                  (setq-local projectile-mode-line "P:remote"))))
    )
  )
 )

;;
;; company-mode
;;     https://github.com/company-mode/company-mode.git
;;
;; Modular in-buffer completion framework (rtags need company)
;;
;; Company is a code completion frontend, meaning it handles all the
;; logic regarding code completion while typing except for actually
;; coming up with completions. So basically, Company does all the work
;; with showing and handling completions, but it needs a brain (backend)
;; to provide it with completions. It can use different sources (packages)
;; of completions, including Irony and Rtags, which work really well for C++.
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
    (global-company-mode t)
    ;;
    ;; using digits to select company-mode candidates
    ;; https://oremacs.com/2017/12/27/company-numbers/
    ;; basic setting
    (setq company-show-numbers t)       ; numbers show next to candidate
    ;; add some bindings
    (let ((map company-active-map))
      (mapc (lambda (x) (define-key map (format "%d" x) 'ora-company-number))
       (number-sequence 0 9))
      (define-key map " " (lambda ()
                            (interactive)
                            (company-abort)
                            (self-insert-command 1)))
      (define-key map (kbd "<return>") nil))
    ;; actual code
    (defun ora-company-number ()
      "Forward to `company-complete-number'.

Unless the number is potentially part of the candidate.
In that case, insert the number."
      (interactive)
      (let* ((k (this-command-keys))
             (re (concat "^" company-prefix k)))
        (if (cl-find-if (lambda (s) (string-match re s))
                        company-candidates)
            (self-insert-command 1)
          (company-complete-number
           (if (equal k "0")
               10
             (string-to-number k))))))
    ;;
    ;; end of using digits to select company-mode candidates
    ;;
    )
  )
 )

;; EOF
