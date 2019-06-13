;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-

;; Rust Mode
(after! rust-mode
  (map! :map rust-mode-map
        :localleader
        :desc "Lookup documentation at point"   :n "d" #'racer-describe
        :desc "Jump to definition at point"     :n "l" #'racer-find-definition))

(map! :leader
      (:prefix "o"
       :desc "ERC"  "i" #'erc-tls))

(map! :map erc-mode-map
        :localleader
        :prefix "e"
        :desc "switch to"  "b" (λ! (erc-switch-to-buffer))
        :desc "quit"        "q" (λ! (erc-quit-server "quit"))
        :desc "set topic"   "t" (λ! (erc-set-topic)))

(map! (:when (featurep! :editor evil)
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

(load! "dwim" doom-private-dir t)

(map! :map (list c-mode-map c++-mode-map)
      "SPC" (λ! (cc-space-dwim))
      "S-SPC" (λ! (insert-char ? )))


(map! :map python-mode-map
      "SPC" (λ! (python-space-dwim))
      "S-SPC" (λ! (insert-char ? )))

(map! :map rust-mode-map
      "SPC" (λ! (rust-space-dwim))
      "S-SPC" (λ! (insert-char ? )))
