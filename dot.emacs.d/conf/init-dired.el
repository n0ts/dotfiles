;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; C-x d dired

;; wdired
(require 'wdired)

;; direct edit
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; change permision
(setq wdired-allow-to-change-permissions t)

;; replace 'ls'
(require 'ls-lisp)
(let (current-load-list)
  (defadvice insert-directory
    (around reset-locale activate compile)
    (let ((system-time-locale "C"))
      ad-do-it)))

;; dired sorter
(load "sorter" nil t)

; highlight today modified files
(defface my-face-f-2 '((t (:foreground "GreenYellow"))) nil)
(defvar my-face-f-2 'my-face-f-2)
(defun my-dired-today-search (arg)
  "Fontlock search function for dired."
  (search-forward-regexp
   (concat (format-time-string "%b %e" (current-time)) " [0-9]....") arg t))

(add-hook 'dired-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              major-mode
              (list
               '(my-dired-today-search . my-face-f-2)
            ))))
