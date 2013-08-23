;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; show line & column number
(global-linum-mode 1)
(column-number-mode t)

;; highlight current line
(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "gray10")


;; paren mode
(show-paren-mode t)
(setq show-paren-style 'mixed)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "black")
(set-face-foreground 'show-paren-match-face "gray64")

;; highlight region area
(setq transient-mark-mode t)

;; highlight search match area
(setq search-highlight t)

;; hightlight tab, 2bytes space, trailing white space
(defface highlight-tab-face            '((t (:background "gray8"))) t)
(defface highlight-trailing-space-face '((t (:foreground "gray20" :underline t))) t)
(defface highlight-jp-space-face       '((t (:foreground "gray20" :background "gray8" :underline t))) t)
(defvar  highlight-tab-face            'highlight-tab-face)
(defvar  highlight-trailing-space-face 'highlight-trailing-space-face)
(defvar  highlight-jp-space-face       'highlight-jp-space-face)
(defvar  highlight-tab-space-mode      nil)
(defvar  highlight-tab-space-alist     '(("\t"  0 highlight-tab-face append)
                                         (" +$" 0 highlight-trailing-space-face append)
                                         ("　"  0 highlight-jp-space-face append)))

(defun highlight-tab-space-mode () (interactive)
  "Highlights TABs, double-byte Japanese spaces and trailing single-byte spaces."
  (cond ((setq highlight-tab-space-mode (not highlight-tab-space-mode))
	 (font-lock-add-keywords nil highlight-tab-space-alist) ; for current buffer.
	 (add-hook 'font-lock-mode-hook	; for other buffers with font-lock-mode.
		   '(lambda () (font-lock-add-keywords nil highlight-tab-space-alist)))
	 (message "highlight-tab-space-mode ... on"))
	(t
	 (font-lock-remove-keywords nil highlight-tab-space-alist)
	 (remove-hook 'font-lock-mode-hook
		      '(lambda () (font-lock-add-keywords nil highlight-tab-space-alist)))
	 (message "highlight-tab-space-mode ... off")))
  (font-lock-fontify-buffer))

(highlight-tab-space-mode)
