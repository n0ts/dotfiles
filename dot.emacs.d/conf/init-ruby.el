;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'ruby-mode)

(defun ruby-mode-set-encoding () ())

(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (set-face-background 'flymake-errline "red4")))

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ruby-block.el --- http://www.emacswiki.org/emacs/ruby-block.el
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

