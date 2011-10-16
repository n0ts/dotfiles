;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'auto-save-buffers)

(run-with-idle-timer 0.5 t 'auto-save-buffers) 

(setq auto-save-list-file-prefix "~/.auto-save-list.d/")
