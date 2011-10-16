;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(defun ack ()
  (interactive)
  (let ((grep-find-command "ack --nocolor --nogroup "))
    (call-interactively 'grep-find)))
