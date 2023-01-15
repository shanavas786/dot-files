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

(setq doom-font (font-spec :family "Hack" :size 15)
      doom-unicode-font (font-spec :family "Hack" :size 15)
      doom-big-font (font-spec :family "Hack" :size 15)
      doom-projectile-fd-binary "fdfind"
      doom-modeline-height 10
      doom-theme 'sanityinc-tomorrow-bright
                                        ;doom-theme 'tango
      doom-buffer-hl-line-mode nil
      python-shell-interpreter "python3"
      flycheck-python-flake8-executable "python3"
      projectile-project-search-path '("/opt/")
      racer-rust-src-path "~/opt/rust/src/"
      ;; for debian
      rtags-rc-binary-name "rtags-rc"
      rtags-rdm-binary-name "rtags-rdm"
      erc-kill-server-buffer-on-quit t
      org-log-done 'time)

(setq elpy-rpc-virtualenv-path "/opt/elpyenv")
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "/opt/elpyenv/bin/python3")

(setq package-archives
      '(("gnu"   . "http://mirrors.163.com/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")))

                                        ; deletes trailing whitespaces on every line upon saving files
(add-hook! 'before-save-hook 'delete-trailing-whitespace)
(add-hook! 'python-mode-hook #'electric-operator-mode)
(add-hook! 'rust-mode-hook #'electric-operator-mode)
(add-hook! 'rust-mode-hook #'electric-operator-mode)
(add-hook! 'c-mode-hook #'electric-operator-mode)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (setq flycheck-global-modes '(not rust-mode))

(use-package! py-isort
  :after python
  :config
  (map! :map python-mode-map
        :localleader
        (:prefix ("s" . "sort")
         :desc "Sort imports" "s" #'py-isort-buffer)))


(define-key evil-normal-state-map (kbd "g~") 'evil-operator-string-inflection)

(setq-hook! 'rust-mode-hook
  fill-column 120)

(setq-hook! 'python-mode-hook
  fill-column 88)

(use-package elpy
  :init
  (elpy-enable))

(after! elpy
  (set-company-backend! 'elpy-mode
    '(elpy-company-backend :with company-files company-yasnippet)))


(auto-save-visited-mode +1)



(load! "bindings")

(setq org-agenda-files (list "/opt/agenda.org"))

(setq diary-file "/opt/diary")

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" "2878517f049b28342d7a360fd3f4b227086c4be8f8409f32e0f234d129cee925" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" "f589e634c9ff738341823a5a58fc200341b440611aaa8e0189df85b44533692b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
