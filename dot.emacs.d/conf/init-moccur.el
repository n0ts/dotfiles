;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'color-moccur)
(require 'moccur-edit)
(setq dmoccur-exclusion-mask
      (append '("\\~$" "\\.svn\\/\*" "\\.git\\/\*") dmoccur-exclusion-mask))
