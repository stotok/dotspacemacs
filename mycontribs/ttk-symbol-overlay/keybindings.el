(spacemacs/declare-prefix "so" "symbol-overlay")
(spacemacs/set-leader-keys
  "soi"  'symbol-overlay-put            ; insert
  "som"  'symbol-overlay-mode           ; mode enable/disable
  "soc"  'symbol-overlay-remove-all     ; clear
  )

;; Default key-bindings defined in symbol-overlay-map:
;; "i" -> symbol-overlay-put
;; "n" -> symbol-overlay-jump-next
;; "p" -> symbol-overlay-jump-prev
;; "w" -> symbol-overlay-save-symbol
;; "t" -> symbol-overlay-toggle-in-scope
;; "e" -> symbol-overlay-echo-mark
;; "d" -> symbol-overlay-jump-to-definition
;; "s" -> symbol-overlay-isearch-literally
;; "q" -> symbol-overlay-query-replace
;; "r" -> symbol-overlay-rename
