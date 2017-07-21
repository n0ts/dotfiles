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

(load "init-global")
(load "init-user")
(load "init-window")
(load "init-color")
(load "init-coding-system")
(load "init-flymake")
(load "init-highlight")
(load "init-keymaps")
(load "init-auto-save-buffers")
(load "init-saveplace")
(load "init-dired")
(load "init-moccur")
(load "init-isearch")
(load "init-emacsclient")
;;(load "init-elscreen")
;;(load "init-dsvn")
(load "init-dmacro")
(load "init-minibuf")
;;(load "init-tramp")
;(load "init-uniquify")
;(load "init-ack")
;;(load "init-gtags")
(load "init-automode")

(load "init-c")
(load "init-cc")
(load "init-css")
(load "init-html")
(load "init-java")
(load "init-javascript")
(load "init-json")
(load "init-mmm")
(load "init-perl")
(load "init-php")
(load "init-puppet")
(load "init-ruby")
(load "init-rails")
(load "init-sh")
(load "init-shell")
(load "init-sql")
;(load "init-migemo")
(load "init-yaml")

(load "init-osx")


;; load local configuration
(load-file "~/.emacs.local")
