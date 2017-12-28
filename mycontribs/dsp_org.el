;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016, 2017 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;****************************************************************************************
;;
;;
;; org mode
;;
(cond
 ((IsDspUserConfig)
  (when (configuration-layer/package-usedp 'org)
    (message "*** dsp_org.el user-config: org-mode customization")
    ;;
    ;; Ref: http://spacemacs.org/layers/+emacs/org/README.html#important-note
    ;; Since version 0.104, spacemacs uses the org version from the org ELPA repository
    ;; instead of the one shipped with emacs. Then, any org related code should not be
    ;; loaded before dotspacemacs/user-config, otherwise both versions will be loaded
    ;; and will conflict. Because of autoloading, calling to org functions will trigger
    ;; the loading up of the org shipped with emacs which will induce conflicts.
    ;; One way to avoid conflict is to wrap your org config code in a with-eval-after-load
    ;;
    (with-eval-after-load 'org
      (setq org-log-done t)
      (setq org-todo-keywords
            '((sequence "TODO" "WIP" "HOLD" "DONE" "CANCEL")))
      ;; always copy all files, due to org not smart enough when the target files
      ;; are no longer exist (e.g. deleted)
      (setq org-publish-use-timestamps-flag nil)
      ;; sure /org italic/ characther look kinda like slanted words, but with added
      ;; baggage of having regular expression characters in your prose. This is to
      ;; hide them, but actually the slash characters (and asterisks for bold, etc)
      ;; are still there, but aren't displayed. To display it, just backspace over it.
      (setq org-hide-emphasis-markers t)
      ;; not to display image in original size
      (setq org-image-actual-width nil)
      ;; org-special-ctrl-a/e, I want it behaves as normal
      ;; https://schenizzle.wordpress.com/2014/03/26/org-mode-ctrl-a-ctrl-e/
      ;;(setq org-special-ctrl-a/e t)
      ;; syntax coloring embedded source code
      (setq org-src-fontify-natively t)
      ;;
      ;; note that org-list-allow-alphabetical only applies to the org-mode source
      ;; files. If it is set to nil, org will ignore lists that use alphabetical
      ;; markers. This doesn't have any impact on how lists are exported, which
      ;; are always numerical.
      ;;
      (setq org-list-allow-alphabetical t)
      ;;
      (setq org-latex-pdf-process
            '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))
      ;;
      ;; Publishing the Website
      ;;(require 'ox-publish) ;; ox-publish already install inside org-plus-contrib package
      (setq org-html-coding-system 'utf-8-unix)
      ;; Project Tree
      (setq org-publish-project-alist
            '(;;
              ;; TODOC project
              ;;
              ("todoc-notes"
              :base-directory "~/project/todoc.org/org/"
              :base-extension "org"
              :publishing-directory "~/project/todoc.org/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("todoc-static"
              :base-directory "~/project/todoc.org/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/todoc.org/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("todoc-org" :components ("todoc-notes" "todoc-static"))
              ;;
              ;; SSDC project
              ;;
              ("ssdc-notes"
              :base-directory "~/project/ssdc/org/"
              :base-extension "org"
              :publishing-directory "~/project/ssdc/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("ssdc-static"
              :base-directory "~/project/ssdc/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/ssdc/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("ssdc-org-html-themes"
              :base-directory "~/project/org-html-themes/styles/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/ssdc/bo/html/styles/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("ssdc-org" :components ("ssdc-notes" "ssdc-static" "ssdc-org-html-themes"))
              ;;
              ;; CISSP project
              ;;
              ("cissp-notes"
              :base-directory "~/project/cissp/org/"
              :base-extension "org"
              :publishing-directory "~/project/cissp/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("cissp-static"
              :base-directory "~/project/cissp/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/cissp/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("cissp-org-html-themes"
              :base-directory "~/project/org-html-themes/styles/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/cissp/bo/html/styles/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("cissp-org" :components ("cissp-notes" "cissp-static" "cissp-org-html-themes"))
              ))
      ;; asterisks and dashes for bullet lists are fine, but having an actual circular
      ;; bullet, is just nice
      (font-lock-add-keywords 'org-mode
                              '(("^ +\\([-*]\\) "
                                (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
      ;; I like this idea from:
      ;;   http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html
      (when nil
        (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                                    ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                                    ((x-list-fonts "Verdana")         '(:font "Verdana"))
                                    ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                                    (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
              (base-font-color     (face-foreground 'default nil 'default))
              (headline           `(:inherit default :weight bold :foreground ,base-font-color)))
          (custom-theme-set-faces 'user
                                  `(org-level-8 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-7 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-6 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-5 ((t (,@headline ,@variable-tuple))))
                                  `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                                  `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                                  `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                                  `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                                  `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil)))))))
      ;;
      ;; org-drill: http://orgmode.org/worg/org-contrib/org-drill.html
      ;;
      ;; (require 'org-drill)
      (add-to-list 'org-modules 'org-drill)
      (setq org-drill-maximum-items-per-session nil) ; unlimited questions
      (setq org-drill-maximum-duration nil)          ; no timeout
      (setq org-drill-save-buffers-after-drill-sessions-p nil) ; no need to save buffer
      (setq org-drill-hide-item-headings-p nil)      ; show heading during drill
      (setq org-drill-add-random-noise-to-intervals-p t)
      (setq org-drill-learn-fraction 0.2)    ; to appear more frequently (default: 0.5)
      ;;
      ) ;; with-eval-after-load 'org
    ;;
    ;;
    ;; Waiting for ox-latex to load before modifying default org-latex-classes
    ;;
    (with-eval-after-load 'ox-latex
      (add-to-list 'org-latex-classes
                   '("article"
                     "\\documentclass{article}"
                     ("\\section{%s}" . "\\section*{%s}")
                     ("\\subsection{%s}" . "\\subsection*{%s}")
                     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                     ("\\paragraph{%s}" . "\\paragraph*{%s}")
                     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
      ) ;; with-eval-after-load 'ox-latex
    ;;
    ;; Waiting for ox-reveal to load
    ;;
    ;; ox-reveal need reveal.js packages, i install from github:
    ;; $ git clone https://github.com/hakimel/reveal.js.git
    ;; and set it's path to org-reveal-root
    ;;
    (with-eval-after-load 'ox-reveal
      (cond
       ((or (IsBoromir) (IsMoonracer))
        (setq org-reveal-root "file:///Volumes/HOME/NewUsers/stotok/project/reveal.js"))
       )
      ) ;; with-eval-after-load 'ox-reveal
    )
  )
 )

;; EOF
