;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;; abo-abo packages here :)
;;
;; This file is supposed to be called from
;;    dotspacemacs/user-config
;; **************************************************************************************

(when (configuration-layer/package-usedp 'ivy)
  (message "<<< user-config: ivy customization")
  (setq ivy-use-virtual-buffers t
        ivy-height 12
        ivy-count-format "(%d/%d)"
        ivy-display-style 'fancy)
  ;;
  ;; i don't like dir buffer. let's change :)
  (define-key ivy-minibuffer-map (kbd "RET") 'ivy-alt-done))

(when (configuration-layer/package-usedp 'swiper)
  (message "<<< user-config: swiper customization")

  ;; simulate "*" in vim with a better swiper interface
  (when nil                             ; let's see first
    (define-key evil-normal-state-map (kbd "*")
      (lambda () (interactive) (swiper (format "\\<%s\\>" (thing-at-point 'symbol)))))
    (define-key evil-normal-state-map (kbd "#")
      (lambda () (interactive) (swiper (format "\\<%s\\>" (thing-at-point 'word))))))

  ;; search or swipe for the current word (another way)
  ;; i.e. after start swiper, use M-j or M-n (with ivy)

  ;; advise swiper to recenter on exit
  ;;     http://pragmaticemacs.com/emacs/dont-search-swipe/
  (defun bjm-swiper-recenter (&rest args)
    "recenter display after swiper"
    (recenter))
  (advice-add 'swiper :after #'bjm-swiper-recenter))

;; EOF
