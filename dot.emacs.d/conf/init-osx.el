;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; Font Configuration
;; create font-set
(let* ((fontset-name "myfonts") ; Name of font-set
       (size 12) ; ASCII font size [9/10/12/14/15/17/19/20/...]
       (asciifont "Menlo") ; ASCII font
       (jpfont "Hiragino Kaku Gothic ProN") ; Japanese font
       (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont))
       (fsn (create-fontset-from-ascii-font font nil fontset-name)))
  (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; hankaku-kana
  (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; bunbofu-tsuki Latin
  (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; Greece characer
  )

(add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

;; font-size matrix
(dolist (elt '(("^-apple-hiragino.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9)))
    (add-to-list 'face-font-rescale-alist elt))

;; set font-size to default face
(set-face-font 'default "fontset-myfonts")
