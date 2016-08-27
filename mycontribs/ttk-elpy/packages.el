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
                ;;(company-mode) ; well, it is supposed already loaded, rite?
                (add-to-list 'company-backends 'elpy-company-backend)))
    ))

;; EOF
