;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; Please install ripgrep:
;;
;; MacPort
;;     $ sudo port install ripgrep
;; Windows/Cygwin
;;     Download binary from https://github.com/dajva/rg.el

(setq ttk-rg-packages
      '(
        rg
        ))

(defun ttk-rg/init-rg ()
  ;;
  ;; rg
  ;;     https://github.com/dajva/rg.el
  (use-package rg
    :init
    ;;
    :config
    ;; (rg-enable-default-bindings (kbd "C-c s"))
    (setq rg-group-result t)

    (defun ttk-rg-goto-file-and-close-rg ()
      (interactive)
      (compile-goto-error)
      ;;(kill-buffer "*rg*") ;; dun kill it, sometimes i wanna go back again
      (delete-other-windows)
      (message "M-x ttk-rg-display-buffer to return to grep buffer."))

    (defun ttk-rg-display-buffer ()
      "Display the *rg* buffer."
      (interactive)
      (let ((buffer (get-buffer "*rg*")))
        (if buffer
            (pop-to-buffer buffer)
          (error "The *rg* buffer does not exist yet"))))

    (with-eval-after-load 'rg
      ;; (define-key rg-mode-map (kbd "o") 'quit-window)
      (define-key rg-mode-map (kbd "o") 'ttk-rg-goto-file-and-close-rg)
      ;;
      (evil-make-overriding-map rg-mode-map 'normal)
      (add-hook 'rg-mode-hook #'evil-normalize-keymaps)
      )
    )
  )
