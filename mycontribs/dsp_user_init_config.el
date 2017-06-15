;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016, 2017 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;****************************************************************************************

;;
;; Notes: This file is called twice by:
;;     1) dotspacemacs/user-init
;;     2) dotspacemacs/user-config
;;
;; Hence, in each files loaded below it is protected/selected by:
;;     1) IsDspUserInit
;;     2) IsDspUserConfig
;;

(when (file-exists-p "~/dotspacemacs/mycontribs/dsp_std.el")
  (load-file "~/dotspacemacs/mycontribs/dsp_std.el"))
(when (file-exists-p "~/dotspacemacs/mycontribs/dsp_modes.el")
  (load-file "~/dotspacemacs/mycontribs/dsp_modes.el"))
(when (file-exists-p "~/dotspacemacs/mycontribs/dsp_magit.el")
  (load-file "~/dotspacemacs/mycontribs/dsp_magit.el"))
(when (file-exists-p "~/dotspacemacs/mycontribs/dsp_faces.el")
  (load-file "~/dotspacemacs/mycontribs/dsp_faces.el"))
(when (file-exists-p "~/dotspacemacs/mycontribs/dsp_etc.el")
  (load-file "~/dotspacemacs/mycontribs/dsp_etc.el"))
(when (file-exists-p "~/dotspacemacs/mycontribs/dsp_org.el")
  (load-file "~/dotspacemacs/mycontribs/dsp_org.el"))
(when (file-exists-p "~/dotspacemacs/mycontribs/dsp_abo.el")
  (load-file "~/dotspacemacs/mycontribs/dsp_abo.el"))

;; EOF
