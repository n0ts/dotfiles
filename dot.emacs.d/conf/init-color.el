;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(global-font-lock-mode t)

(require 'color-theme)

(color-theme-initialize)
(color-theme-clarity)

(set-face-background 'modeline "gainsboro")
(set-face-foreground 'modeline "black")
(set-face-background 'highlight "gray10")
(set-face-foreground 'highlight "red")
(set-face-background 'scroll-bar "gray30")
(set-face-foreground 'scroll-bar "gray0")
(set-face-background 'tool-bar "black")
