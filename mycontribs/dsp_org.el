;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016 Totok Sulistiomono
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
      ;; org-special-ctrl-a/e, I want it behaves as normal
      ;; https://schenizzle.wordpress.com/2014/03/26/org-mode-ctrl-a-ctrl-e/
      ;;(setq org-special-ctrl-a/e t)
      ;; syntax coloring embedded source code
      (setq org-src-fontify-natively t)
      ;; publishing (specific for each project)
      ;;(require 'ox-publish) ;; ox-publish already install inside org-plus-contrib package
      (setq org-publish-project-alist
            '(;; TODOC project
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
              ;; DNOTE project
              ("dnote-notes"
              :base-directory "~/project/dnote/org/"
              :base-extension "org"
              :publishing-directory "~/project/dnote/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("dnote-static"
              :base-directory "~/project/dnote/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/dnote/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("dnote-org-html-themes"
              :base-directory "~/project/org-html-themes/styles/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/dnote/bo/html/styles/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("dnote-org" :components ("dnote-notes" "dnote-static" "dnote-org-html-themes"))
              ;; omaha.org project here
              ("omaha.org-notes"
              :base-directory "~/project/omaha.org/org/"
              :base-extension "org"
              :publishing-directory "~/project/omaha.org/bo/html/"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 4             ; Just the default for this project.
              :auto-preamble t)
              ("omaha.org-static"
              :base-directory "~/project/omaha.org/org/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/omaha.org/bo/html/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("omaha.org-org-html-themes"
              :base-directory "~/project/org-html-themes/styles/"
              :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              :publishing-directory "~/project/omaha.org/bo/html/styles/"
              :recursive t
              :publishing-function org-publish-attachment)
              ("omaha.org-org" :components ("omaha.org-notes" "omaha.org-static" "omaha.org-org-html-themes"))
              ;; SSDC project
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
              ("ssdc-org" :components ("ssdc-notes" "ssdc-static" "ssdc-org-html-themes"))))
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
      ) ;; with-eval-after-load 'org
    )
  )
 )

;; EOF
