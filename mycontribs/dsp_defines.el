;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016 Totok Sulistiomono
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
(defmacro IsBraeburn ()
  (string-prefix-p "braeburn" system-name t))
(defmacro IsSG2-SATT93 ()
  (string-prefix-p "sg2-satt93" system-name t))
(defmacro IsKKB-SATT93 ()
  (string-prefix-p "kkb-satt93" system-name t))
(defmacro IsKKC-SATT93 ()
  (string-prefix-p "kkc-satt93" system-name t))
(defmacro Is8N9ZP32 ()
  (string-prefix-p "8n9zp32" system-name t))
(defmacro IsPolaris ()
  (string-prefix-p "polaris" system-name t))
(defmacro IsBilbo ()
  (string-prefix-p "bilbo" system-name t))
(defmacro IsFrodo ()
  (string-prefix-p "frodo" system-name t))
(defmacro IsPippin ()
  (string-prefix-p "pippin" system-name t))
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
   ((IsKKC-SATT93)
    (message "IsKKC-SATT93: TRUE"))
   ((Is8N9ZP32)
    (message "Is8N9ZP32: TRUE"))
   ((IsPolaris)
    (message "IsPolaris: TRUE"))
   ((IsBilbo)
    (message "IsBilbo: TRUE"))
   ((IsFrodo)
    (message "IsFrodo: TRUE"))
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
