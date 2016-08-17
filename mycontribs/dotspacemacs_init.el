;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************

;; **************************************************************************************
;; Utilities for programming mode
;; **************************************************************************************
;;
;; Fonts
;;
(cond
 ((eq system-type 'darwin)
  (setq-default
    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Hack"
                                :size 12
                                :weight normal
                                :width normal
                                :powerline-scale 1.1))
  ) ;; darwin
 ((eq system-type 'gnu/linux)
  (setq-default
    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Inconsolata"
                                :size 14
                                :weight normal
                                :width normal
                                :powerline-scale 1.2))
  ) ;; gnu/linux
 ((or (eq system-type 'cygwin) (eq system-type 'windows-nt))
  ;; This is to fix error when calling server start on startup
  (require 'server)
  (and (>= emacs-major-version 23)
        (defun server-ensure-safe-dir (dir) "Noop" t))
  (setq-default
    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Consolas"
                                :size 12
                                :weight normal
                                :width normal
                                :powerline-scale 1.1))
  ) ;; cygwin or windows
 (t
  (setq-default
    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Source Code Pro"
                                :size 13
                                :weight normal
                                :width normal
                                :powerline-scale 1.1))
  ) ;; t
 ) ;; conditional
