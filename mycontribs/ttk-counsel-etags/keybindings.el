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
    "e."   'counsel-etags-find-tag-at-point
    "et"   'counsel-etags-grep-symbol-at-point
    "es"   'counsel-etags-find-tag
    )
)

;; EOF
