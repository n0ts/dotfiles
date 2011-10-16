;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq auto-mode-alist 
  (append '(

            ("\\.js$"   . javascript-mode)
            ("\\.pl$"   . cperl-mode)
            ("\\.perl$" . cperl-mode)
            ("\\.tex$"  . yatex-mode)
            ("\\.sty$"  . yatex-mode)
            ("\\.cls$"  . yatex-mode)
            ("\\.clo$"  . yatex-mode)
            ("\\.dtx$"  . yatex-mode)
            ("\\.fdd$"  . yatex-mode)
            ("\\.ins$"  . yatex-mode)
            ("\\.s?html?$" . html-helper-mode)
            ("\\.inc$"  . php-mode)
            ("\\.php$"  . html-helper-mode)
            ("\\.py$"   . python-mode)
            ("\\.rb$"   . ruby-mode)
            ("\\.tpl$"  . html-helper-mode)
            ("\\.jsp$"  . html-helper-mode)
            ("\\.css$"  . css-mode)
            ("\\.js$"   . java-mode)
           ) auto-mode-alist))
