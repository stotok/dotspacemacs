;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;****************************************************************************************
;;
;; 2016, 2017, 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;****************************************************************************************
;;
;; ***************************************************************************************
;;
;; magit
;;    https://github.com/magit/magit.git
;;
;; ***************************************************************************************

(cond
 ((IsDspUserInit)
  (message "*** dsp_magit.el user init: magit customization")
  ;;
  (when t
    (setq-default git-magit-status-fullscreen t)) ;; magit status in fullscreen
  ;;
  ;; let's workaround sloppyyyyy performance on windows
  ;; not fix, but at least can help a bit
  (cond
   ((IsWindows)
    ;;
    ;; Tweak No.1
    ;; https://magit.vc/manual/magit/Performance.html
    ;; Tell Magit to only automatically refresh the current Magit buffer, but not the
    ;; status buffer. If you do that, then the status buffer is only refreshed
    ;; automatically if it is the current buffer.
    (setq magit-refresh-status-buffer nil)
    ;;
    ;; Tweak No.2
    ;; Ref: https://emacs.stackexchange.com/questions/19440/magit-extremely-slow-in-windows-how-do-i-optimize
    ;; Something you can do in magit is to follow the author's advice
    ;; in setting up a minimal magit-status just for staging
    ;; WORKAROUND https://github.com/magit/magit/issues/2395
    (define-derived-mode magit-staging-mode magit-status-mode "Magit staging"
      "Mode for showing staged and unstaged changes."
      :group 'magit-status)
    (defun magit-staging-refresh-buffer ()
      (magit-insert-section (status)
                            (magit-insert-untracked-files)
                            (magit-insert-unstaged-changes)
                            (magit-insert-staged-changes)))
    (defun magit-staging ()
      (interactive)
      (magit-mode-setup #'magit-staging-mode))
    ;;
    ;;
    ;;
    ) ; IsWindows
   )
  ;;
  ;; https://magit.vc/manual/magit/Performance.html
  ;;
  ;; Committing Performance
  ;;
  ;; When you initiate a commit, then Magit by default automatically shows a diff
  ;; of the changes you are about to commit. For large commits this can take a long
  ;; time, which is especially distracting when you are committing large amounts of
  ;; generated data which you don’t actually intend to inspect before committing.
  ;; This behavior can be turned off using:
  (remove-hook 'server-switch-hook 'magit-commit-diff)
  ;; Then you can type C-c C-d to show the diff when you actually want to see it,
  ;; but only then. Alternatively you can leave the hook alone and just type C-g in
  ;; those cases when it takes too long to generate the diff. If you do that, then
  ;; you will end up with a broken diff buffer, but doing it this way has the
  ;; advantage that you usually get to see the diff, which is useful because it
  ;; increases the odds that you spot potential issues.
  )
 )

;; EOF
