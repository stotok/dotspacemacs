;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; Please install universal ctags:
;;
;; MacPort
;;     $ sudo port install ctags
;; Windows/Cygwin
;;     Download from https://github.com/universal-ctags/ctags
;;
;; To generate tag file (please use command line)
;; Go to project root, then:
;;     $ ctags -R -e .
;;     $ mv tags TAGS

(setq ttk-counsel-etags-packages
      '(
        counsel-etags
        ))

(defun ttk-counsel-etags/init-counsel-etags ()
  ;;
  ;; counsel-etags
  ;;     https://github.com/redguardtoo/counsel-etags
  (use-package counsel-etags
    :init
    (eval-when-compile
      ;; silence missing function warnings
      (declare-function counsel-etags-virtual-update-tags "counsel-etags.el")
      (declare-function counsel-etags-guess-program "counsel-etags.el")
      (declare-function counsel-etags-locate-tags-file "counsel-etags.el")
      )
    ;;
    :config
    ;; ignore files above 800kb
    (setq counsel-etags-max-file-size 800)
    ;; ignore build directories for tagging
    (add-to-list 'counsel-etags-ignore-directories '"build*")
    (add-to-list 'counsel-etags-ignore-directories '".vscode")
    (add-to-list 'counsel-etags-ignore-filenames '".clang-format")
    ;; don't ask before rereading the TAGS file if they have changed
    (setq tags-revert-without-query t)
    ;; dont' warn then TAGS files are large
    (setq large-file-warning-threshold nil)
    ;; how many seconds to wait before rerunning tags for auto-update
    (setq counsel-etags-update-interval 180)
    ;; setup auto update
    (add-hook
     'prog-mode-hook
     (lambda () (add-hook 'after-save-hook
                          (lambda ()
                            (counsel-etags-virtual-update-tags)))))

      ;; The function provided by counsel-etags is broken (at least on Linux)
      ;; and doesn't correctly exclude directories, leading to an excessive
      ;; amount of incorrect tags. The issue seems to be that the trailing '/'
      ;; in e.g. '*dirname/*' causes 'find' to not correctly exclude all files
      ;; in that directory, only files in sub-directories of the dir set to be
      ;; ignore.
  ;;   (defun my-scan-dir (src-dir &optional force)
  ;;     "Create tags file from SRC-DIR. \
  ;; If FORCE is t, the commmand is executed without \
  ;; checking the timer."
  ;;     (let* ((find-pg (or
  ;;                     counsel-etags-find-program
  ;;                     (counsel-etags-guess-program "find")))
  ;;           (ctags-pg (or
  ;;                       counsel-etags-tags-program
  ;;                       (format "%s -e -L" (counsel-etags-guess-program
  ;;                                           "ctags"))))
  ;;           (default-directory src-dir)
  ;;           ;; run find&ctags to create TAGS
  ;;           (cmd (format
  ;;                 "%s . \\( %s \\) -prune -o -type f -not -size +%sk %s | %s -"
  ;;                 find-pg
  ;;                 (mapconcat
  ;;                   (lambda (p)
  ;;                     (format "-iwholename \"*%s*\"" p))
  ;;                   counsel-etags-ignore-directories " -or ")
  ;;                 counsel-etags-max-file-size
  ;;                 (mapconcat (lambda (n)
  ;;                               (format "-not -name \"%s\"" n))
  ;;                             counsel-etags-ignore-filenames " ")
  ;;                 ctags-pg))
  ;;           (tags-file (concat (file-name-as-directory src-dir) "TAGS"))
  ;;           (doit (or force (not (file-exists-p tags-file)))))
  ;;       ;; always update cli options
  ;;       (when doit
  ;;         (message "%s at %s" cmd default-directory)
  ;;         (shell-command cmd)
  ;;         (visit-tags-table tags-file t))
  ;;       )
  ;;     )
    ;;
    ;; (setq counsel-etags-update-tags-backend
    ;;       (lambda ()
    ;;         (interactive)
    ;;         (let* ((tags-file (counsel-etags-locate-tags-file)))
    ;;           (when tags-file
    ;;             (my-scan-dir (file-name-directory tags-file) t)
    ;;             (run-hook-with-args
    ;;             'counsel-etags-after-update-tags-hook tags-file)
    ;;             (unless counsel-etags-quiet-when-updating-tags
    ;;               (message "%s is updated!" tags-file))))
    ;;         )
    ;;       )
    )
  )
