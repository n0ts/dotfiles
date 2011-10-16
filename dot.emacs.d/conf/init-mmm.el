;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'mmm-mode)
(require 'mmm-auto)
(require 'mmm-vars)
(require 'mmm-compat)
(setq mmm-global-mode 'maybe)

;; mmm-mode definitions
(setq mmm-submode-decoration-level 2)
(set-face-background 'mmm-default-submode-face "black")

;; html + javascript
(mmm-add-classes
 '((html-js
    :submode java-mode
    :front "<script [^>]*>?"
    :back "</script>?")))
(mmm-add-mode-ext-class 'html-helper-mode "\\.s?html?\\'" 'html-js)

;; html + css
(mmm-add-classes
 '((html-css
    :submode css-mode
    :front "<style [^>]*>?"
    :back "</style>?")))
(mmm-add-mode-ext-class 'html-helper-mode "\\.s?html?\\'" 'html-css)

;; html + php
(mmm-add-classes
 '((html-php
    :submode php-mode
    :front "<\\?\\(php\\)?"
    :back "\\?>")))
(mmm-add-mode-ext-class 'html-helper-mode "\\.php?\\'" 'html-php)
(mmm-add-mode-ext-class 'html-helper-mode "\\.tpl?\\'" 'html-php)

;; html + jsp
(mmm-add-classes
 '((html-jsp
    :submode java-mode
    :front "<%"
    :back "\\%>")))
(mmm-add-mode-ext-class 'html-helper-mode "\\.jsp?\\'" 'html-jsp)
