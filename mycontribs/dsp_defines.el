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
(defmacro IsPolaris ()
  (or (string= system-name "polaris") (string= system-name "polaris.local") (string= system-name "polaris.hgst.com")))
(defmacro IsBilbo ()
  (or (string= system-name "bilbo") (string= system-name "bilbo.local") (string= system-name "bilbo.hgst.com")))
(defmacro IsFrodo ()
  (or (string= system-name "frodo") (string= system-name "frodo.local")))
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
   ((IsPolaris)
    (message "IsPolaris: TRUE"))
   ((IsBilbo)
    (message "IsBilbo: TRUE"))
   ((IsFrodo)
    (message "IsFrodo: TRUE"))
   (t
    (message "Unknown HOSTNAME."))))

;; EOF
