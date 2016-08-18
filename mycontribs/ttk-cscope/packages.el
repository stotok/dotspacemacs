;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-cscope-packages
      '(
        (xcscope :location local)
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
  ;;     $ pycscope-indexser
  (use-package xcscope
    :init
    (setq cscope-do-not-update-database t)
    (setq cscope-edit-single-match nil)
    ))

;; EOF
