;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016-2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************

;; ----------------------------------------------------------------------------------
;; This is loaded during initialization in dotspacemacs/init
;; ----------------------------------------------------------------------------------
;;
;; System Customization
;;
(cond
 ((IsOSX)
  (setq-default
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(;; https://fonts.google.com/specimen/Inconsolata
                               ;; https://github.com/googlefonts/Inconsolata.git
                               "Inconsolata"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   )) ;; darwin
 ((IsGNULinux)
  (cond
   ((IsIgd0464u)
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '(;; available in x11 fonts
                                 "fixed"
                                 :size 12
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1)
     ))
   ((IsRatchet)
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '(;; $ sudo apt-get install fonts-inconsolata
                                 "Inconsolata"
                                 :size 16
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.3)
     ))
   (t
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '(;; $ sudo apt-get install fonts-inconsolata
                                 "Inconsolata"
                                 :size 14
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1)
     )))) ;; gnu/linux
 ((or (IsCygwin) (IsWindows))
  ;; This is to fix error when calling server start on startup
  ;;(require 'server)
  ;;(and (>= emacs-major-version 23)
  ;;      (defun server-ensure-safe-dir (dir) "Noop" t))
  ;;
  (setq-default
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(;; Default from microsoft office
                               "Consolas"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
    )) ;; cygwin or windows
 (t
  (setq-default
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   )) ;; t
 )

;;
;; Theme customization
;;
(cond
 ((or (IsCeleborn) (IsGandalf) (IsBoromir) (IsMoonracer) (IsBumblebee) (IsIronhide))
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         )
   ))
 ((or (IsRatchet) (IsIgd0464u) (IsIgl2465g) (IsJazz) (IsSentinel))
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         material
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         )
   ))
 (t
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         spacemacs-light
                         leuven
                         )
   )) ; t
 ) ; themes

;; EOF
