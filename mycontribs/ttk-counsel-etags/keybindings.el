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
(defun ivy-occur-display-counsel-egrep ()
  "Display the *ivy-occur* buffer."
  (interactive)
  (let ((buffer (get-buffer "*ivy-occur counsel-etags-find-tag \"\"*")))
    (if buffer
        (pop-to-buffer buffer)
      (error"The *ivy-occur cousel-etags-find-tag \"\"* buffer does not exisst yet"))))

(dolist (mode '(c-mode c++-mode))
  (spacemacs/declare-prefix-for-mode mode "me" "etags")
  (spacemacs/set-leader-keys-for-major-mode mode
    "eb"   'ivy-occur-display-counsel-egrep
    "ed"   'counsel-etags-find-tag-at-point
    "es"   'counsel-etags-grep-symbol-at-point
    "eS"   'counsel-etags-find-tag
    "eu"   'xref-pop-marker-stack
    "er"   'counsel-etags-recent-tag
    )
)

;; EOF
