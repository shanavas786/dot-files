;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-mail-address "shanavas.m2@gmail.com"
      user-full-name "Shanavas M")

; exactly one newline at the end of every file, unconditionally
(setq delete-trailing-lines t
      global-auto-revert-mode t
      require-final-newline t
      display-line-numbers-type 'relative)


(require 'color-theme-sanityinc-tomorrow)
;; (color-theme-sanityinc-tomorrow-bright)

(setq doom-font (font-spec :family "Hack" :size 14)
      doom-unicode-font (font-spec :family "Hack" :size 14)
      doom-big-font (font-spec :family "Hack" :size 14)
      doom-projectile-fd-binary "fdfind"
      doom-modeline-height 10
      doom-theme 'sanityinc-tomorrow-bright
      doom-buffer-hl-line-mode nil
      python-shell-interpreter "python3"
      flycheck-python-flake8-executable "python3"
      racer-rust-src-path "~/foss/rust/src/"
      ;; for debian
      rtags-rc-binary-name "rtags-rc"
      rtags-rdm-binary-name "rtags-rdm"
      erc-kill-server-buffer-on-quit t
      org-log-done 'time)


(setq package-archives
      '(("gnu"   . "http://mirrors.163.com/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")))

; deletes trailing whitespaces on every line upon saving files
(add-hook! 'before-save-hook 'delete-trailing-whitespace)
(add-hook! 'python-mode-hook #'electric-operator-mode)
(add-hook! 'rust-mode-hook #'electric-operator-mode)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (setq flycheck-global-modes '(not rust-mode))

(def-package! py-isort
  :after python
  :config
  (map! :map python-mode-map
        :localleader
        (:prefix ("s" . "sort")
          :desc "Sort imports" "s" #'py-isort-buffer)))


(setq-hook! 'rust-mode-hook
  fill-column 120)

(setq-hook! 'python-mode-hook
  fill-column 99)


(load! "bindings")
