;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-

;; Rust Mode
(after! rust-mode
  (map! :map rust-mode-map
        :localleader
        :desc "Lookup documentation at point"   :n "d" #'racer-describe
        :desc "Jump to definition at point"     :n "l" #'racer-find-definition))

(map! (:when (featurep! :feature evil)
        :m "gl"    #'avy-goto-line))
