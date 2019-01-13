;;; packages.el --- rj-mode layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Vaz <vaz@nil.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `rj-mode-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `rj-mode/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `rj-mode/pre-init-PACKAGE' and/or
;;   `rj-mode/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq ttk-rj-packages
  '((rj-mode :location local)))

(defun ttk-rj/init-rj-mode()
  (use-package rj-mode
    :init
    (progn
      (spacemacs|add-toggle rj-mode
        :mode rj-mode
        :documentation "Toggle rj (recenter after jump) mode"
        :on-message "rj-mode activated"
        :evil-leader "tR")

      (spacemacs/set-leader-keys
        "t C-R" 'global-rj-mode)

      (spacemacs|diminish rj-mode " ⊖" " -"))
    :config
    (global-rj-mode 1)
    ))

;;; packages.el ends here
