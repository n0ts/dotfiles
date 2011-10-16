;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; set keyboard translate C-h is backspace
(keyboard-translate ?\C-h ?\C-?)

;; buffer window resize key setting
(define-key global-map [S-left] 'shrink-window-horizontally)
(define-key global-map [S-right] 'enlarge-window-horizontally)
(define-key global-map [S-up] 'shrink-window)
(define-key global-map [S-down] 'enlarge-window)

;; prefer backward-kill-word over backspace
(define-key minibuffer-local-completion-map "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; redo
(require 'redo)
(global-set-key "\C-]" 'redo)

;; move home & end
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

;; indent-region
(global-set-key "\C-x\C-i" 'indent-region)

;; invoke M-x without the Alt key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; backsplash
(define-key global-map [2213] nil)
(define-key global-map [67111077] nil)
(define-key global-map [134219941] nil)
(define-key global-map [201328805] nil)
(define-key function-key-map [2213] [?\\])
(define-key function-key-map [67111077] [?\C-\\])
(define-key function-key-map [134219941] [?\M-\\])
(define-key function-key-map [201328805] [?\C-\M-\\])
(define-key global-map [3420] nil)
(define-key global-map [67112284] nil)
(define-key global-map [134221148] nil)
(define-key global-map [201330012] nil)
(define-key function-key-map [3420] [?\\])(
define-key function-key-map [67112284] [?\C-\\])
(define-key function-key-map [134221148] [?\M-\\])
(define-key function-key-map [201330012] [?\C-\M-\\])

;; goto-line
(global-set-key "\M-g" 'goto-line)

