;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2018-2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;; see rg.el
;;
(spacemacs/declare-prefix "sr" "ripgrep")
(spacemacs/set-leader-keys
  "srb"  'ttk-rg-display-buffer
  "srd"  'rg-dwim
  "srk"  'rg-kill-saved-searches
  "srl"  'rg-list-searches
  "srp"  'rg-project
  "srr"  'rg
  "srs"  'rg-save-search
  "srS"  'rg-save-search-as-name
  "srt"  'rg-literal
  )

;; EOF
