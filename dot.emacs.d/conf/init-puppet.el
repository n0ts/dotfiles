;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq puppet-indent-level 4)

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
