;; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2018-2019 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************
;;
;;
;; Note: There is already default spacemacs ripgrep keybindings 'srr'
;;       Let's override them :)
(spacemacs/declare-prefix "sr" "ripgrep")
(spacemacs/set-leader-keys
  "srb"  'ttk-deadgrep-display-buffer
  ;; "srd"  'rg-dwim
  ;; "srk"  'rg-kill-saved-searches
  ;; "srl"  'rg-list-searches
  ;; "srp"  'rg-project
  "srr"  'deadgrep
  ;; "srs"  'rg-save-search
  ;; "srS"  'rg-save-search-as-name
  ;; "srt"  'rg-literal
  )

;; EOF
