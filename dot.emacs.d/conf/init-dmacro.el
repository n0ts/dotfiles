;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; Dynamic Macro http://www.pitecan.com/DynamicMacro/
(defconst *dmacro-key* "\C-t" "Repeat operation key")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)
