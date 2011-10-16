;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))
(setq rails-use-mongrel t)

(require 'rails)
