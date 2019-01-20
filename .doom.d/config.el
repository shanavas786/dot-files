;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-mail-address "shanavas.m2@gmail.com"
      user-full-name "Shanavas M")

(set-irc-server! "irc.mozilla.org"
                 `(:use-tls t
                            :nick "shanavas"
                            :sasl-username "shanavas"
                            :channels ("#emacs")))

(map! :leader
      (:prefix "o"
        :desc "IRC"  "I" #'=irc))

                                        ; exactly one newline at the end of every file, unconditionally
(setq require-final-newline t)
(setq delete-trailing-lines t)

(setq doom-font (font-spec :family "Hack" :size 15)
      doom-unicode-font (font-spec :family "Hack" :size 15)
      doom-big-font (font-spec :family "Hack" :size 15))

                                        ; deletes trailing whitespaces on every line upon saving files
(add-hook! 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'default-frame-alist '(fullscreen . maximized))


(setq display-line-numbers-type 'relative)

(setq-hook! 'rust-mode-hook fill-column 120)

(setq-hook! 'python-mode-hook
  fill-column 99
  python-shell-interpreter "/usr/bin/python3")

(setq racer-rust-src-dir "~/foss/rust/")

(load! "bindings")
