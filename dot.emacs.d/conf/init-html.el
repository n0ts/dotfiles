;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(autoload 'asp-html-helper-mode "html-helper-mode" "HTML helper mode" t)
(autoload 'jsp-html-helper-mode "html-helper-mode" "HTML helper mode" t)

(setq html-helper-do-write-file-hooks t)
(setq html-helper-build-new-buffer nil)
(setq tempo-interactive nil)
(setq html-helper-basic-offset 2)
(setq html-helper-item-continue-indent 5)
(setq html-helper-never-indent nil)
