;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016-2019 Totok Sulistiomono
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
    (setq beacon-push-mark 0)           ; won't push the mark
    (setq beacon-color "#666600")
    (setq beacon-blink-when-point-moves-vertically 10) ; min lines vertical movement
    (setq beacon-blink-when-window-scrolls nil) ; no need when scrolls
    (setq beacon-blink-when-focused nil)  ; blink when emacs gains focus, don't want :)
    (setq beacon-blink-duration 0.5)      ; seconds that the blink should last
    (setq beacon-blink-delay 0.3)         ; seconds before starting to fade the beacon
    :config
    (beacon-mode t)))

;; EOF
