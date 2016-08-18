;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-cscope-packages
      '((xcscope :location local)

        ;; exclude package. this will prevent the package from being installed even if
        ;; it is used by another layer
        (ggtags :excluded t)
        ))

(defun ttk-cscope/init-xcscope ()
  ;; This is from stock CVS xcscope.el
  ;;
  ;; for C/C++ install cscope:
  ;;     $ sudo apt-get install cscope
  ;;     $ cscope-indexer
  ;;
  ;; for Python install pycscope:
  ;;     $ sudo pip install pycscope
  ;;     $ pycscope-indexer
  (use-package xcscope
    :init
    (setq cscope-do-not-update-database t
          cscope-edit-single-match nil)
    :config
    (spacemacs/set-leader-keys-for-major-mode 'c-mode
      "gc" 'cscope-find-global-definition-no-prompting
      )
    ;;(evilified-state-evilify-map cscope-list-entry-keymap
    ;;  :mode cscope-list-entry-mode
    ;;  :bindings
    ;;  (kbd "C-S-o") 'cscope-select-entry-one-window)
    ))

;; EOF
