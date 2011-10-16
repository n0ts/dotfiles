;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; svn
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

;; dired hool
(add-hook 'dired-mode-hook
          '(lambda ()
             (require 'dired-x)
             (define-key dired-mode-map "V" 'svn-status)
             (turn-on-font-lock)
             ))
(setq svn-status-hide-unmodified t)
(setq process-coding-system-alist
      (cons '("svn" . utf-8) process-coding-system-alist))
