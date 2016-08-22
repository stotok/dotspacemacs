;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-shrink-whitespace-packages
      '(
        shrink-whitespace
        ))

(defun ttk-shrink-whitespace/init-shrink-whitespace ()
  ;; shrink-whitespace.el
  ;;     https://github.com/jcpetkovich/shrink-whitespace.el.git
  ;;
  ;; delete blank lines and shrink whitespace
  (use-package shrink-whitespace
    :defer t
    :bind (("M-\\" . shrink-whitespace))))

;; EOF
