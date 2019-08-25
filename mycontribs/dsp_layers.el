;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016-2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************

;; ----------------------------------------------------------------------------------
;; Loading private layers stored in ~/dotspacemacs/mycontribs/
;; ----------------------------------------------------------------------------------

;;
;; For all systems
;;
;; show quotes on echo area at startup, alas, spacemacs overrides it
(add-to-list 'dotspacemacs-configuration-layers '(ttk-quotes))
;; persistent spacemacs frame/window position/size on startup
(add-to-list 'dotspacemacs-configuration-layers '(frame-geometry))
;; shrink whitespace and lines around point
(add-to-list 'dotspacemacs-configuration-layers '(ttk-shrink-whitespace))
;; never loose your cursor again
;; (add-to-list 'dotspacemacs-configuration-layers '(ttk-beacon))
;; c/c++
(add-to-list 'dotspacemacs-configuration-layers '(ttk-cscope))
(add-to-list 'dotspacemacs-configuration-layers '(ttk-cpp))
(add-to-list 'dotspacemacs-configuration-layers '(ttk-counsel-etags))
;; rj-mode, evil-goto-line center the screen
;; (add-to-list 'dotspacemacs-configuration-layers '(ttk-rj))
;; don't need this symbol-overlay because redundant with default expand region and edit
;; (add-to-list 'dotspacemacs-configuration-layers '(ttk-symbol-overlay))

;;
;; For each OS
;;
(cond
 ((or (IsWindows) (IsCygwin))
  ;; well, please bear with the sloowwwwwly git on windoz
  ;; (add-to-list 'dotspacemacs-configuration-layers '(git))
  )
 ((IsOSX)
  (add-to-list 'dotspacemacs-configuration-layers '(git))
  )
 ((IsGNULinux)
  (add-to-list 'dotspacemacs-configuration-layers '(git)))
 )

;;
;; For each system having installed and setup necessary tools
;;
(cond
 ((IsCeleborn)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy)))
 ((IsSentinel)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  )
 ((IsGrimlock)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  )
 ((IsJazz)
  ;; (add-to-list 'dotspacemacs-configuration-layers '(ttk-deadgrep))
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsMoonracer)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsBumblebee)
;;  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsIgl2465w)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  )
 ((IsIgd0464u)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  )
 ((IsIronhide)
  ;; (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsRatchet)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  )
 ((IsEpsilon)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  )
 ((IsSideswipe)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rg))
  )
 )

;; EOF
