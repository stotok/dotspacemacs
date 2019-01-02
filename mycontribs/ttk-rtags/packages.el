;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016-2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
(setq ttk-rtags-packages
      '(
        rtags
        ))

(defun ttk-rtags/init-rtags ()
  ;;
  ;; use rtags flycheck mode -- clang warnings shown inline
  ;; this is to turn on rtags flycheck integration support
  (use-package flycheck-rtags
    :ensure rtags)
  ;;
  ;; rtags
  ;;     https://github.com/Andersbakken/rtags.git
  ;;
  ;; A c/c++ client/server indexer for c/c++/objc[++] with integration
  ;; for Emacs based on clang
  ;;
  ;; Setup
  ;; - ninja
  ;; - cmake
  ;; - Bear
  ;; - make
  ;;   $ make clean
  ;;   $ make -nk | rc -c -
  ;; - man-in-the-middle
  (use-package rtags
    :init
    (setq rtags-use-bookmarks nil           ; no need bookmark
          rtags-use-helm nil                ; long live avy :)
          rtags-jump-to-first-match nil     ; show first :)
          rtags-tracking nil                ; dun want auto show target
          rtags-highlight-current-line nil  ; global hiline mode is already on by default
          rtags-autostart-diagnostics t     ; enable rtags diagnostics
          rtags-completions-enabled t       ; enable completion in rtags
          )
    :config
    ;;
    ;; ensure that we use only rtags checking
    ;; https://github.com/Andersbakken/rtags#optional-1
    ;;
    (defun setup-flycheck-rtags ()
      (interactive)
      (flycheck-select-checker 'rtags)
      (setq-local flycheck-highlighting-mode nil) ; rtags creates more accurate overlays
      (setq-local flycheck-check-syntax-automatically nil))
    ;; c-mode-common-hook is also called by c++-mode
    (add-hook 'c-mode-common-hook #'setup-flycheck-rtags)
    ;;
    ;; add company-rtags to company-backends
    ;;
    ;;(push 'company-rtags company-backends) ; change to below
    (with-eval-after-load 'company           ; defer until after company is loaded
      (add-to-list 'company-backends 'company-rtags))
    ;;
    ;; alright, enable keybindings now
    ;;
    (rtags-enable-standard-keybindings)
    )
  )

;; EOF
