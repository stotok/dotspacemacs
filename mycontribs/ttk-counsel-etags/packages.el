;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; Please install universal ctags:
;;
;; MacPort
;;     $ sudo port install ctags
;; Windows/Cygwin
;;     Download from https://github.com/universal-ctags/ctags
;;
;; To generate tag file (please use command line)
;; Go to project root, then:
;;     c-mode c++-mode:
;;     $ ctags-indexer.sh -r -v
;;     general:
;;     $ ctags -R -e .
;;     $ mv tags TAGS
;;
;; Note-1
;; 1. counsel-etags reread TAGS once it detects timestamp change
;;
;; Note-2
;; 1. If counsel-etags-find-tag-at-point cannot find a tag in TAGS,
;; 2. It will do counsel-etags-grep-symbol-at-point using grep (or
;;    ripgrep if available), hence, if we want to ignore certain
;;    files/directories during grepping, we need to do:
;;    For common/general:
;;        (add-to-list 'counsel-etags-ignore-filenames "TAGS.files")
;;        (add-to-list 'counsel-etags-ignore-filenames "cscope.out")
;;    For specific project:
;;    - ripgrep: .ignore (or .rgignore) in project root
;;      /TAGS     <- file
;;      /doc/     <- directory
;;      *.min.js* <- regexp
;;    - grep   : as usual
;;
(setq ttk-counsel-etags-packages
      '(
        counsel-etags
        ))

(defun ttk-counsel-etags/init-counsel-etags ()
  ;;
  ;; counsel-etags
  ;;     https://github.com/redguardtoo/counsel-etags
  (use-package counsel-etags
    :init
    ;; (eval-when-compile
    ;;   ;; silence missing function warnings
    ;;   (declare-function counsel-etags-virtual-update-tags "counsel-etags.el")
    ;;   (declare-function counsel-etags-guess-program "counsel-etags.el")
    ;;   (declare-function counsel-etags-locate-tags-file "counsel-etags.el")
    ;;   )
    ;;
    :config
    ;; ignore files above 800kb
    (setq counsel-etags-max-file-size 800)
    ;; ignore file names
    (add-to-list 'counsel-etags-ignore-filenames "TAGS.files")
    (add-to-list 'counsel-etags-ignore-filenames "cscope.out")
    ;; don't ask before rereading the TAGS file if they have changed
    (setq tags-revert-without-query t)
    ;; dont' warn then TAGS files are large
    (setq large-file-warning-threshold nil)
    ;; how many seconds to wait before rerunning tags for auto-update
    ;;(setq counsel-etags-update-interval 180)
    (setq counsel-etags-update-interval 9999999) ; well,, make it laarrge enough
    ;; no need to automatically update tag, don't be lazy, run ctags-indexer.sh manually
    (setq counsel-etags-stop-auto-update-tags t)
    ;; setup auto update
    ;; (add-hook
    ;;  'prog-mode-hook
    ;;  (lambda () (add-hook 'after-save-hook
    ;;                       (lambda ()
    ;;                         (counsel-etags-virtual-update-tags)))))
    )
  )
