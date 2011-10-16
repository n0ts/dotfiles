;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(defconst *dmacro-key* "\M-t" "Repeat operation key")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)
