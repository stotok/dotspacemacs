;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2019 Totok Sulistiomono
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

(setq ttk-deadgrep-packages
      '(
        deadgrep
        ))

(defun ttk-deadgrep/init-deadgrep ()
  ;;
  ;; deadgrep
  ;;     https://github.com/Wilfred/deadgrep
  (use-package deadgrep
    :init
    ;;
    :config
    ;; override same function in deadgrep.el
    ;; force result buffer name to '*deadgrep*
    (defun deadgrep--buffer-name (search-term directory)
      (format "*deadgrep*"
              search-term
              (abbreviate-file-name directory)))
    ;;
    (defun ttk-deadgrep-display-buffer ()
      "Display the *deadgrep* buffer."
      (interactive)
      (let ((buffer (get-buffer "*deadgrep*")))
        (if buffer
            (pop-to-buffer buffer)
          (error "The *deadgrep* buffer does not exist yet"))))
    ;;
    (with-eval-after-load 'deadgrep
      (evil-make-overriding-map deadgrep-mode-map 'normal)
      (add-hook 'deadgrep-mode-hook #'evil-normalize-keymaps)
      )
    )
  )
