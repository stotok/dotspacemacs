;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2018-2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; see counsel-etags
;;
(dolist (mode '(c-mode c++-mode))
  (spacemacs/declare-prefix-for-mode mode "me" "etags")
  (spacemacs/set-leader-keys-for-major-mode mode
    "ed"   'counsel-etags-find-tag-at-point
    "es"   'counsel-etags-grep-symbol-at-point
    "ea"   'counsel-etags-find-tag
    )
)

;; EOF
