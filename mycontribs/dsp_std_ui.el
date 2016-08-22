;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;; For/from standard emacs distribution
;; This file is supposed to be called from
;;    dontspacemacs/user-init
;; alas,
;;    configuration-layer/package-usedp
;; cannot be used.
;; **************************************************************************************

;;
;; Keyboard Remap
;;
(when (eq system-type 'darwin)
  (message ">>> user-init: keyboard remap on OSX ...")
  ;; 1) Mac build-in Keyboard & Mouse preference:
  ;;    - Swap [CapsLock] and [Control]
  ;;
  ;; 2) KeyRemap4MacBook:
  ;;    - Map [Option_R] to [Control_R] (only in Emacs, Terminal, X11)
  ;;    Note: This KeyRemap4MacBook no need anymore because I can remap
  ;;          option to control using mac-option-modifier below ...
  ;;
  ;; 3) Then below:
  ;;
  ;;    See https://emacsformacosx.com/tips
  ;;    Here's variables controlling the modifier keys:
  ;;
  ;;    - ns-alternate-modifier
  ;;    - ns-command-modifier
  ;;    - ns-control-modifier
  ;;    - ns-function-modifier
  ;;    - ns-option-modifier (just a different name for ns-alternate-modifier)
  ;;    - ns-right-alternate-modifier
  ;;    - ns-right-command-modifier
  ;;    - ns-right-control-modifier
  ;;    - ns-right-option-modifier
  ;;
  ;;    Each variable can be set to 'control, 'meta, 'alt, 'super, or 'hyper.
  ;;
  ;;    In addition ns-alternative-modifier (and ns-option-modifier) can be set to 'none,
  ;;    which lets it get interpreted by the OS so it can be used to input special
  ;;    characters.
  ;;
  ;;    The ns-right-* variables are set to 'left by default which makes them the same as
  ;;    their left counterpart.
  (setq mac-command-modifier 'meta)    ; [Command] behaves like [Meta]
  (setq mac-option-modifier 'control)) ; [Option] behaves like [Control]

;; EOF
