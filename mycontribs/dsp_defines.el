;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016-2020 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;****************************************************************************************

;; ***************************************************************************************
;; This is called at very beginning of spacemacs initialization
;; ***************************************************************************************
;;
;; Provide macro to determine operating systems and version of emacs
;;
;; Notes:
;;
;; 1. How to determine OS in elisp.
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
;; ***************************************************************************************
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
(defmacro IsCeleborn ()
  (string-prefix-p "celeborn" system-name t))
(defmacro IsGandalf ()
  (string-prefix-p "gandalf" system-name t))
(defmacro IsBoromir ()
  (string-prefix-p "boromir" system-name t))
(defmacro IsSentinel ()
  (string-prefix-p "sentinel" system-name t))
(defmacro IsJazz ()
  (string-prefix-p "jazz" system-name t))
(defmacro IsMoonracer ()
  (string-prefix-p "moonracer" system-name t))
(defmacro IsBumblebee ()
  (string-prefix-p "bumblebee" system-name t))
(defmacro IsIgl2465w ()
  (string-prefix-p "IGL2465W" system-name t))
(defmacro IsIgd0464u ()
  (string-prefix-p "igd0464u" system-name t))
(defmacro IsIronhide ()
  (string-prefix-p "ironhide" system-name t))
(defmacro IsRatchet ()
  (string-prefix-p "ratchet" system-name t))
(defmacro IsEpsilon ()
  (string-prefix-p "epsilon" system-name t))
(defmacro IsSideswipe ()
  (string-prefix-p "sideswipe" system-name t))
(defmacro IsGrimlock ()
  (string-prefix-p "grimlock" system-name t))
(defmacro IsJolt ()
  (string-prefix-p "jolt" system-name t))
(defmacro IsIgl6301w ()
  (string-prefix-p "IGL6301W" system-name t))
(defmacro IsLoge ()
  (string-prefix-p "loge" system-name t))

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
   ((IsCeleborn)
    (message "IsCeleborn: TRUE"))
   ((IsGandalf)
    (message "IsGandalf: TRUE"))
   ((IsBoromir)
    (message "IsBoromir: TRUE"))
   ((IsJazz)
    (message "IsJazz: TRUE"))
   ((IsMoonracer)
    (message "IsMoonracer: TRUE"))
   ((IsBumblebee)
    (message "IsBumblebee: TRUE"))
   ((IsIgl2465w)
    (message "IsIgl2465w: TRUE"))
   ((IsIgl6301w)
    (message "IsIgl6301w: TRUE"))
   ((IsIgd0464u)
    (message "IsIgd0464u: TRUE"))
   ((IsIronhide)
    (message "IsIronhide: TRUE"))
   ((IsRatchet)
    (message "IsRatchet: TRUE"))
   ((IsSentinel)
    (message "IsSentinel: TRUE"))
   ((IsEpsilon)
    (message "IsEpsilon: TRUE"))
   ((IsSideswipe)
    (message "IsSideswipe: TRUE"))
   ((IsGrimlock)
    (message "IsGrimlock: TRUE"))
   ((IsJolt)
    (message "IsJolt: TRUE"))
   ((IsLoge)
    (message "IsLoge: TRUE"))
   (t
    (message "Unknown HOSTNAME."))))

;;
;; Global variables and macro to determine if it's in 'user init' or 'user config' state
;;

(defconst DSP-STATE-USER-DEFAULT 0 "State of dotspacemacs default.")
(defconst DSP-STATE-USER-INIT    1 "State of dotspacemacs user init.")
(defconst DSP-STATE-USER-CONFIG  2 "State of dotspacemacs user config.")
(defconst DSP-STATE-USER-DONE    3 "State of dotspacemacs user done.")

(defvar ttk-dotspacemacs-state)         ; global variable to determine at which state are we
(setq ttk-dotspacemacs-state DSP-STATE-USER-DEFAULT) ; initial state

;; Use these macro to determine at which state we are during initialization
(defmacro IsDspUserInit ()
  (= ttk-dotspacemacs-state DSP-STATE-USER-INIT))
(defmacro IsDspUserConfig ()
  (= ttk-dotspacemacs-state DSP-STATE-USER-CONFIG))

;; EOF
