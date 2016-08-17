;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-beacon-packages
      '(
        beacon 
        ))

(defun ttk-beacon/init-beacon ()
  ;; beacon
  ;;     https://github.com/Malabarba/beacon.git
  ;;
  ;; never lose your cursor again
  (use-package beacon
    :init
    (setq beacon-push-mark 0)             ; dunno what, just set it to 0 :)
    (setq beacon-color "#666600")
    (setq beacon-blink-when-focused nil)  ; blink when emacs gains focus, don't want :)
    :config
    (beacon-mode t)))

;; EOF
