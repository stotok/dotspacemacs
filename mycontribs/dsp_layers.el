;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016, 2017 Totok Sulistiomono
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
(add-to-list 'dotspacemacs-configuration-layers '(ttk-beacon))
;; c/c++ indexer
(add-to-list 'dotspacemacs-configuration-layers '(ttk-cscope))

;;
;; For each OS
;;
(cond
 ((or (IsWindows) (IsCygwin))
  ;; well, git on cygwin is sucks sloooowwwwwwwww
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
 ((IsFrodo)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rtags))
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsKKD-SATT93)
;;  (add-to-list 'dotspacemacs-configuration-layers '(ttk-rtags))
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsSG2-SATT93)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsPippin)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsC02SC24MG8WN)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy))
  )
 ((IsCeleborn)
  (add-to-list 'dotspacemacs-configuration-layers '(ttk-elpy)))
 )

;; EOF
