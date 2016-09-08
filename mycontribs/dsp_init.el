;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************

;; **************************************************************************************
;; This is called at very beginning of spacemacs initialization
;; **************************************************************************************
;;
;; Provide macro to determine operating systems and version of emacs
;;
;; Notes:
;;
;; 1. This .emacs is configured to support Emacs 24 and above only.
;;    It is due to the usage of use-package that is available on Emacs 24 and above.
;;
;; 2. How to determine OS in elisp.
;;
;;    `system-type' is a variable defined in `C source code'.
;;
;;    Documentation:
;;    Value is symbol indicating type of operating system you are using.
;;    Special values:
;;      `gnu'         compiled for a GNU Hurd system.
;;      `gnu/linux'   compiled for a GNU/Linux system.
;;      `darwin'      compiled for Darwin (GNU-Darwin, Mac OS X, ...).
;;      `ms-dos'      compiled as an MS-DOS application.
;;      `windows-nt'  compiled as a native W32 application.
;;      `cygwin'      compiled using the Cygwin library.
;;    Anything else indicates some sort of Unix system.
;;
;; **************************************************************************************
;;
;; Determine the OS
;; On Linux
(defmacro IsGNULinux ()
  (eq system-type 'gnu/linux))
;; On Windows --> Native emacs for windows
(defmacro IsWindows ()
  (eq system-type 'windows-nt))
;; On Cygwin --> Cygwin emacs-w32
(defmacro IsCygwin ()
  (eq system-type 'cygwin))
;; On Mac OS X
(defmacro IsOSX ()
  (eq system-type 'darwin))
;;
;; Determine hostname
;;
(defmacro IsBraeburn ()
  (string= system-name "braeburn"))
(defmacro IsSG2-SATT93 ()
  (string= system-name "SG2-SATT93.msg.asia.wdc.com"))
(defmacro IsKKB-SATT93 ()
  (string= system-name "kkb-satt93"))
(defmacro IsCrux ()
  (string= system-name "crux"))
(defmacro IsPolaris ()
  (or (string= system-name "polaris") (string= system-name "polaris.local") (string= system-name "polaris.hgst.com")))
;;
;; Display OS and HOSTNAME information
;;
(when t
  ;; DISPLAY OS
  (cond
   ((IsWindows)
    (message "IsWindows: TRUE"))
   ((IsCygwin)
    (message "IsCygwin: TRUE"))
   ((IsGNULinux)
    (message "IsGNULinux: TRUE"))
   ((IsOSX)
    (message "IsOSX: TRUE"))
   (t
    (message "Unknown OS.")))
  ;; DISPLAY HOSTNAME
  (cond
   ((IsBraeburn)
    (message "IsBraeburn: TRUE"))
   ((IsSG2-SATT93)
    (message "IsSG2-SATT93: TRUE"))
   ((IsKKB-SATT93)
    (message "IsKKB-SATT93: TRUE"))
   ((IsCrux)
    (message "IsCrux: TRUE"))
   ((IsPolaris)
    (message "IsPolaris: TRUE"))
   (t
    (message "Unknown HOSTNAME."))))
;;
;;
;; Fonts
;;
(cond
 ((IsOSX)
  (setq-default
    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Hack"
                                :size 12
                                :weight normal
                                :width normal
                                :powerline-scale 1.1)
    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press <SPC> T n to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(
                          leuven
                          spacemacs-dark
                          spacemacs-light
                          sanityinc-solarized-dark
                          sanityinc-solarized-light
                          heroku
                          zenburn
                          anti-zenburn
                          )
    )) ;; darwin
 ((IsGNULinux)
  (setq-default
    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Inconsolata"
                                :size 14
                                :weight normal
                                :width normal
                                :powerline-scale 1.2)
    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press <SPC> T n to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(
                          spacemacs-dark
                          spacemacs-light
                          sanityinc-solarized-dark
                          sanityinc-solarized-light
                          leuven
                          heroku
                          zenburn
                          anti-zenburn
                          )
    )) ;; gnu/linux
 ((or (IsCygwin) (IsWindows))
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
                                :powerline-scale 1.1)
    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press <SPC> T n to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(
                          spacemacs-dark
                          spacemacs-light
                          sanityinc-solarized-dark
                          sanityinc-solarized-light
                          leuven
                          heroku
                          zenburn
                          anti-zenburn
                          )
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
    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press <SPC> T n to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(
                          spacemacs-dark
                          spacemacs-light
                          sanityinc-solarized-dark
                          sanityinc-solarized-light
                          leuven
                          heroku
                          zenburn
                          anti-zenburn
                          )
    )) ;; t
 ) ;; conditional

;; EOF
