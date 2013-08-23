;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; hide startup message
(setq inhibit-startup-message t)

;; no backup file
(setq backup-inhibited t)

;; find-flie option
(setq read-file-name-completion-ignore-case t)

;; partial width character
(setq truncate-partial-width-windows nil)

;; edit
(setq kill-whole-line nil)
(setq next-line-add-newlines nil)

;; show image
(setq image-file-name-extensions
      '("xcf" "png" "jpeg" "jpg" "gif" "tiff" "tif" "xbm" "xpm" "pbm" "pgm" "ppm"))

;; no bell and no flash screen
(setq visible-bell t)
(setq ring-bell-function (lambda ()))

;; drap&drap file
(define-key global-map [ns-drag-file] 'ns-find-file)
