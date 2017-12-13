;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016, 2017 Totok Sulistiomono
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
(defmacro IsSG2-SATT93 ()
  (string-prefix-p "sg2-satt93" system-name t))
(defmacro IsFrodo ()
  (string-prefix-p "frodo" system-name t))
(defmacro IsC02SC24MG8WN ()
  (string-prefix-p "C02SC24MG8WN" system-name t))
(defmacro IsCeleborn ()
  (string-prefix-p "celeborn" system-name t))
(defmacro IsGandalf ()
  (string-prefix-p "gandalf" system-name t))
(defmacro IsBoromir ()
  (string-prefix-p "boromir" system-name t))
(defmacro IsKali ()
  (string-prefix-p "kali" system-name t))
(defmacro IsSentinel ()
  (string-prefix-p "sentinel" system-name t))
(defmacro IsOptimus ()
  (string-prefix-p "optimus" system-name t))
(defmacro IsMoonracer ()
  (string-prefix-p "moonracer" system-name t))
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
   ((IsSG2-SATT93)
    (message "IsSG2-SATT93: TRUE"))
   ((IsFrodo)
    (message "IsFrodo: TRUE"))
   ((IsC02SC24MG8WN)
    (message "IsC02SC24MG8WN: TRUE"))
   ((IsCeleborn)
    (message "IsCeleborn: TRUE"))
   ((IsGandalf)
    (message "IsGandalf: TRUE"))
   ((IsBoromir)
    (message "IsBoromir: TRUE"))
   ((IsKali)
    (message "IsKali: TRUE"))
   ((IsSentinel)
    (message "IsSentinel: TRUE"))
   ((IsOptimus)
    (message "IsOptimus: TRUE"))
   ((IsMoonracer)
    (message "IsMoonracer: TRUE"))
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
