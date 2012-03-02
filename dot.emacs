;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; load path
(setq load-path
      (cons (expand-file-name "~/.emacs.d/conf")
	    load-path))

(let ((dir (expand-file-name "~/.emacs.d/elisp")))
  (if (member dir load-path) nil
    (setq load-path (cons dir load-path))
    (let ((default-directory dir))
      (load (expand-file-name "subdirs.el") t t t))))

(load "init-window")

;; load local configuration
(load-file "~/.emacs.local")
