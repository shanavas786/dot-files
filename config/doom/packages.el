;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! emacs-snippets
  :recipe (:host github
           :repo "hlissner/emacs-snippets"
           :files ("*")))

;; disable current line hightlighting
(package! hl-line :disable t)

(package! color-theme-sanityinc-tomorrow)

(package! electric-operator)

;;(package! restclient)

(package! graphviz-dot-mode)

;; (package! elpy)

(package! string-inflection)
(package! evil-string-inflection)
