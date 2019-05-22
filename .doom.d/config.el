;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-mail-address "shanavas.m2@gmail.com"
      user-full-name "Shanavas M")

(set-irc-server! "irc.freenode.net"
                 `(:tls t
                        :nick "shanavas"
                        :port 6697
                        :sasl-username "shanavas"
                        :channels ("#emacs")))
(map! :leader
      (:prefix "o"
        :desc "IRC"  "I" #'=irc))

; exactly one newline at the end of every file, unconditionally
(setq delete-trailing-lines t
      global-auto-revert-mode t
      require-final-newline t
      display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "Hack" :size 14)
      doom-unicode-font (font-spec :family "Hack" :size 14)
      doom-big-font (font-spec :family "Hack" :size 14)
      python-shell-interpreter "python3"
      flycheck-python-flake8-executable "python3"
      doom-projectile-fd-binary "fdfind"
      doom-theme 'doom-tomorrow-night)

(setq package-archives
      '(("gnu"   . "http://mirrors.163.com/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")))

; deletes trailing whitespaces on every line upon saving files
(add-hook! 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; (setq flycheck-global-modes '(not rust-mode))

(setq-hook! 'rust-mode-hook
  fill-column 120)

(setq-hook! 'python-mode-hook
  fill-column 99)

(setq racer-rust-src-path "~/foss/rust/src/")

(setq rtags-rc-binary-name "rtags-rc"
      rtags-rdm-binary-name "rtags-rdm")


(load! "bindings")
