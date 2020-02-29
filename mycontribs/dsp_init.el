;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016-2020 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************

;; ----------------------------------------------------------------------------------
;; This is loaded during initialization in dotspacemacs/init
;; ----------------------------------------------------------------------------------

;;
;; well, let's just use local repository
;; see: https://github.com/d12frosted/elpa-mirror
;;
;; step-1: git clone --depth 1 https://github.com/d12frosted/elpa-mirror.git ~/.elpa-mirror
;; step-2: setup spacemacs configuration as follows:
(setq configuration-layer-elpa-archives
      '(("melpa" . "~/.elpa-mirror/melpa/")
        ("org"   . "~/.elpa-mirror/org/")
        ("gnu"   . "~/.elpa-mirror/gnu/")))

;;
;; System Customization
;; To show font list: M-x menu-set-font
(cond
 ((IsOSX)
  (setq-default
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(;; https://fonts.google.com/specimen/Inconsolata
                               ;; https://github.com/googlefonts/Inconsolata.git
                               ;; "Inconsolata"
                               ;; :size 14
                               ;; https://input.fontbureau.com
                               "Input Mono Narrow"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   )) ;; darwin
 ((IsGNULinux)
  ;; To install custom fonts in linux:
  ;; $ mkdir ~/.fonts
  ;; $ rsync ~/Download/NewFonts/ ~/.fonts/
  ;; and delete non fonts file (e.g. text files)
  ;; $ cd ~/.fonts
  ;; $ fc-cache -fv
  ;;
  ;; To list available fonts in linux:
  ;; $ fc-list | grep InputSans
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
   ((IsIgl6301w)
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '(;; https://input.fontbureau.com
                                 ;; "Input Sans Narrow"
                                 ;; "Input Mono"
                                 ;; "Input Mono Narrow"
                                 "Input Mono Condensed"
                                 ;; "Input Mono Compressed"
                                 :size 12
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1)
     ))
   ((IsLoge)
    (setq-default
     ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
     ;; quickly tweak the mode-line size to make separators look not too crappy.
     dotspacemacs-default-font '(;; https://input.fontbureau.com
                                 ;; "Input Sans Narrow"
                                 ;; "Input Mono"
                                 "Input Mono Narrow"
                                 ;; "Input Mono Condensed"
                                 ;; "Input Mono Compressed"
                                 :size 12
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1)
     ))
   ((or (IsRatchet) (IsEpsilon))
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
 ((or (IsRatchet) (IsIgd0464u) (IsIgl2465w) (IsJazz) (IsSentinel) (IsEpsilon) (IsSideswipe) (IsGrimlock) (IsJolt) (IsIgl6301w) (IsLoge))
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
