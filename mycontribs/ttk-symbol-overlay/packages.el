;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;; ***************************************************************************************
;;
;; 2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;; ***************************************************************************************
(setq ttk-symbol-overlay-packages
      '(
        symbol-overlay
        ))

(defun ttk-symbol-overlay/init-symbol-overlay ()
    ;;
    ;; https://github.com/wolray/symbol-overlay
    ;;
    (use-package symbol-overlay         ; highlight symbol
      ;; :bind (:map symbol-overlay-mode-map
      ;;             ("M-h" . symbol-overlay-put)
      ;;             ("M-n" . symbol-overlay-jump-next)
      ;;             ("M-p" . symbol-overlay-jump-prev))
      :hook ((conf-mode . symbol-overlay-mode)
             (html-mode . symbol-overlay-mode)
             (prog-mode . symbol-overlay-mode)
             (yaml-mode . symbol-overlay-mode))
      )
    )
