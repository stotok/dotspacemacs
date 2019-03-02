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
    (eval-when-compile
      ;; silence missing function warnings
      (declare-function counsel-etags-virtual-update-tags "counsel-etags.el")
      (declare-function counsel-etags-guess-program "counsel-etags.el")
      (declare-function counsel-etags-locate-tags-file "counsel-etags.el")
      )
    ;;
    :config
    ;; ignore files above 800kb
    (setq counsel-etags-max-file-size 800)
    ;; don't ask before rereading the TAGS file if they have changed
    (setq tags-revert-without-query t)
    ;; dont' warn then TAGS files are large
    (setq large-file-warning-threshold nil)
    ;; how many seconds to wait before rerunning tags for auto-update
    (setq counsel-etags-update-interval 180)
    ;; setup auto update
    (add-hook
     'prog-mode-hook
     (lambda () (add-hook 'after-save-hook
                          (lambda ()
                            (counsel-etags-virtual-update-tags)))))
    )
  )
