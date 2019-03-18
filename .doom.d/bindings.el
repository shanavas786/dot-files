;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-

;; Rust Mode
(after! rust-mode
  (map! :map rust-mode-map
        :localleader
        :desc "Lookup documentation at point"   :n "d" #'racer-describe
        :desc "Jump to definition at point"     :n "l" #'racer-find-definition))

(map! (:when (featurep! :feature evil)
        :m "gl"    #'avy-goto-line
        :i "C->"   #'scroll-up-command
        :i "C-<"   #'scroll-down-command
        :n "g>"    #'scroll-up-command
        :n "g<"    #'scroll-down-command
        :i "C-h"   #'delete-backward-char))

;      (general-def :keymaps +default-minibuffer-maps
;       "C-w"    #'backward-kill-word
;       "C-h"    #'delete-backward-char))
;


(map! :map (list python-mode-map rust-mode-map
                 c-mode-map c++-mode-map)
      "SPC" (λ! (insert-char ?_))
      "S-SPC" (λ! (insert-char ? )))
