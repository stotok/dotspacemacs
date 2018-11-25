;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016, 2017, 2018 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; **************************************************************************************
;; utilities for (programming modes)
;; **************************************************************************************

;;
;; tcl-mode
;;
(cond
 ((IsDspUserConfig)
  (message "*** dsp_modes.el user config: tcl-mode customization")
  ;;
  ;; to make $ not part of a symbol, hence, $ not part of dabbrev as well :)
  (with-eval-after-load "tcl"
    (modify-syntax-entry ?$ "'" tcl-mode-syntax-table))
  )
 )

;;
;; python-mode
;;
(cond
 ((IsDspUserConfig)
  (message "*** dsp_modes.el user config: python-mode customization")
  ;;
  (setq-default python-indent-offset 4)
  (setq python-shell-completion-native-enable nil)
  ;; Don't spam message buffer when python-mode can't guess indent-offset
  (setq python-indent-guess-indent-offset-verbose nil)
  )
 )

;;
;; plantuml-mode
;; Need 'dot' utility from graphviz package:
;;      $ sudo port install graphviz (macport)
;;      $ sudo apt-get install graphviz (debian)
;; then set env var:
;;      $ export GRAPHVIZ_DOT="/opt/local/bin/dot" (macport)
;;      $ export GRAPHVIZ_DOT="/usr/bin/dot" (debian)
;;
(cond
 ((IsDspUserConfig)
  (when (configuration-layer/package-usedp 'plantuml-mode)
    (message "*** dsp_modes.el user config: plantuml-mode customization")
    ;;
    (setq plantuml-jar-path "~/dotspacemacs/plantuml/plantuml.jar")
    ;; (setq plantuml-jar-path "`cygpath -w -a /cygdrive/d/DSUsers/uia53572/dotspacemacs/plantuml/plantuml.jar`")
    ;; (setq plantuml-jar-path "D:\DSUsers\uia53572\dotspacemacs\plantuml\plantuml.jar")      ; NO
    ;;
    ;; (setq plantuml-jar-path (shell-command-to-string (format "cygpath -w -a ~/dotspacemacs/plantuml/plantuml.jar")))      ; NO
    ;;;;;;;;(setq plantuml-jar-path (expand-file-name "~/dotspacemacs/plantuml/plantuml.jar"))
    ;;
    ;; (setq plantuml-jar-path "`cygpath -w -a ~/dotspacemacs/plantuml/plantuml.jar'") ; NO
    ;; (setq plantuml-jar-path (expand-file-name "`cygpath -w -a ~/dotspacemacs/plantuml/plantuml.jar`"))
    ;; (setq plantuml-jar-path (expand-file-name "`cygpath -m ~/dotspacemacs/plantuml/plantuml.jar`"))
    ;; https://github.com/skuro/plantuml-mode/issues/22
    ;; (setq plantuml-jar-path "`cygpath -w -a /cygdrive/d/DSUsers/uia53572/dotspacemacs/plantuml/plantuml.jar`")
    ;; (shell-quote-argument (convert-standard-filename plantuml-jar-path))
    ;; enable plantuml-mode for PlantUML files
    (setq auto-mode-alist (cons '("\\.plantuml$" . plantuml-mode) auto-mode-alist))
    (setq auto-mode-alist (cons '("\\.uml$"      . plantuml-mode) auto-mode-alist))
    )
  )
 )

;; EOF
