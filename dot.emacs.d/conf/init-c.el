;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; M - ; insert comment
;; M C - p jump to function begin and end
;; M C - n jumpp to kakko
;; M - a move to statement begin
;; M - e move to statement end
;; M - . jump to function (CTAGS)
;; M - + jump to original position (CTAGS)

(setq-default indent-tabs-mode nil)
(setq c-tab-always-indent nil)
(setq c-default-style "bsd")
(setq c-block-comments-indent-p 3)
(setq c-basic-offset 2)

(autoload 'c-mode "cc-mode" "C editing mode" t)
