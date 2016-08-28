;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-elpy-packages
      '(
        elpy

        ;; exclude package. this will prevent the package from being installed even if
        ;; it is used by another layer
        (anaconda :excluded t)
        ))

(defun ttk-elpy/init-elpy ()
  ;;
  ;; elpy
  ;;     https://github.com/jorgenschaefer/elpy
  ;;     http://chillaranand.github.io/emacs-py-ide/
  ;;
  ;; emacs lisp python environment
  ;;
  ;; 0th: install necessary packages
  ;;      $ sudo apt-get install python3-setuptools
  ;;      $ sudo apt-get install python3-pip
  ;;      $ sudo -H pip3 install virtualenvwrapper
  ;; 1st: setup python virtualenv (see .bash_etc)
  ;;      $ select_python3
  ;; 2nd: create python3 virtualenv
  ;;      $ mkvirtualenv elpy3 -p /usr/bin/python3
  ;; 3rd: $ workon elpy3 (next time after step-2nd done, because step-2nd auto workon)
  ;; 4th: install these package via pip.
  ;;      $ pip3 install jedi         <- i prefer jedi instead of rope
  ;;      $ pip3 install flake8       <- for code checks
  ;;      $ pip3 install importmagic  <- for automatic imports
  ;;      $ pip3 install autopep8     <- auto PEP8 formatting
  ;;      $ pip3 install yapf         <- code formatting
  ;; 5th: from emacs:
  ;;      M-x pyvenv-workon elpy3
  ;; 6th: check:
  ;;      M-x elpy-config
  ;;
  (use-package elpy
    :diminish elpy-mode                 ; dun wan to show 'Elpy' at modeline
    :init
    (setq elpy-rpc-backend "jedi")        ; either "rope" or "jedi"
    :config
    (elpy-enable)
    (remove-hook 'elpy-modules 'elpy-module-flymake)               ; too noisy
    (remove-hook 'elpy-modules 'elpy-module-highlight-indentation) ; too noisy
    ;(add-hook 'elpy-mode-hook 'elpy-use-ipython)
    ;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
    (add-hook 'python-mode-hook
              (lambda ()
                (company-mode) ; well, it is supposed already loaded, rite?
                (add-to-list 'company-backends 'elpy-company-backend)))
    ;;
    ;; keybinding
    ;;
    (spacemacs/set-leader-keys-for-major-mode 'python-mode
      ;; (define-key map (kbd "<backspace>") 'python-indent-dedent-line-backspace)
      ;; (define-key map (kbd "<backtab>")   'python-indent-dedent-line)

      ;; (define-key map (kbd "C-M-x")   'python-shell-send-defun)
      ;; (define-key map (kbd "C-c <")   'python-indent-shift-left)
      ;; (define-key map (kbd "C-c >")   'python-indent-shift-right)
      ;;(define-key map (kbd "C-c RET") 'elpy-importmagic-add-import)
      ;;(define-key map (kbd "C-c C-b") 'elpy-nav-expand-to-indentation)
      ;;(define-key map (kbd "C-c C-c") 'elpy-shell-send-region-or-buffer)
      ;;(define-key map (kbd "C-c C-d") 'elpy-doc)
      ;;(define-key map (kbd "C-c C-e") 'elpy-multiedit-python-symbol-at-point)
      ;;(define-key map (kbd "C-c C-f") 'elpy-find-file)
      ;;(define-key map (kbd "C-c C-n") 'elpy-flymake-next-error)
      ;;(define-key map (kbd "C-c C-o") 'elpy-occur-definitions)
      ;;(define-key map (kbd "C-c C-p") 'elpy-flymake-previous-error)
      "es" 'elpy-rgrep-symbol
      "eb" 'rgrep-display-buffer
      ;;(define-key map (kbd "C-c C-t") 'elpy-test)
      ;;(define-key map (kbd "C-c C-v") 'elpy-check)
      ;;(define-key map (kbd "C-c C-z") 'elpy-shell-switch-to-shell)
      ;;(define-key map (kbd "C-c C-r") elpy-refactor-map)

      ;;(define-key map (kbd "<S-return>") 'elpy-open-and-indent-line-below)
      ;;(define-key map (kbd "<C-S-return>") 'elpy-open-and-indent-line-above)

      ;;(define-key map (kbd "<C-return>") 'elpy-shell-send-current-statement)

      ;;(define-key map (kbd "<C-down>") 'elpy-nav-forward-block)
      ;;(define-key map (kbd "<C-up>") 'elpy-nav-backward-block)
      ;;(define-key map (kbd "<C-left>") 'elpy-nav-backward-indent)
      ;;(define-key map (kbd "<C-right>") 'elpy-nav-forward-indent)

      ;;(define-key map (kbd "<M-down>") 'elpy-nav-move-line-or-region-down)
      ;;(define-key map (kbd "<M-up>") 'elpy-nav-move-line-or-region-up)
      ;;(define-key map (kbd "<M-left>") 'elpy-nav-indent-shift-left)
      ;;(define-key map (kbd "<M-right>") 'elpy-nav-indent-shift-right)

      "ed" 'elpy-goto-definition
      ;;(define-key map (kbd "C-x 4 M-.")     'elpy-goto-definition-other-window)
      ;;(define-key map (kbd "M-TAB")   'elpy-company-backend)
      "eu" 'pop-tag-mark
      )
  ))

;; EOF
