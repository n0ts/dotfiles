;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'tramp)

(setq tramp-default-method "ssh")
(setq tramp-completion-without-shell-p t)
(setq tramp-shell-prompt-pattern "^[ $]+")
(setq tramp-debug-buffer t)
(add-to-list 'backup-directory-alist
                  (cons tramp-file-name-regexp nil))
(add-to-list 'tramp-remote-path "/usr/bin")
(modify-coding-system-alist 'process "ssh" 'euc-japan-unix)
