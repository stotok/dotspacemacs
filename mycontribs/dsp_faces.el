;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016, 2017, 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;****************************************************************************************

;; ***************************************************************************************
;; Faces/font/eye-candy related stuff
;; ***************************************************************************************

;;
;; spacemacs-theme
;;     https://github.com/nashamri/spacemacs-theme
;;
(cond
 ((IsDspUserInit)
  (message "*** dsp_faces.el user init: spacemacs-theme customization")
  ;;
  (when t
    (setq spacemacs-theme-comment-bg nil) ; why the heck got background :(
    (setq spacemacs-theme-org-height nil) ; don't change height of org-mode headlines
    ;; original color for comment is too strong
    ;; use http://www.colorpicker.com to determine RGB value
    (cond
     ((or (IsCygwin) (IsWindows))
      (custom-set-variables '(spacemacs-theme-custom-colors
                              '((comment . "#137C87")))) ; #2aa1ae (original spacemacs-dark)
      )
     (t
      (custom-set-variables '(spacemacs-theme-custom-colors
                              '((comment . "#137C87")))) ; #2aa1ae (original spacemacs-dark)
      ))
    )
  )
 )

;;
;; rainbow-delimiters
;;     https://github.com/Fanael/rainbow-delimiters.git
;;
;; balanced and colorful delimiters
;; https://github.com/Fanael/rainbow-delimiters
;;
;; Toggle single buffer: M-x rainbow-delimiters-mode
(cond
 ((IsDspUserConfig)
  (when (configuration-layer/package-usedp 'rainbow-delimiters) ; see if it's slow on large files
    (message "*** dsp_faces.el user config: rainbow-delimiters customization")
    ;;
    (if nil  ; only on certain mode
        (progn
          (add-hook 'c-mode-common-hook #'rainbow-delimiters-mode)
          (setq-default frame-background-mode 'dark))
      (progn ; on most programming modes (emacs 24 and above)
        (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))))
  )
 )

;; EOF
