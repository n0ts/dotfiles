;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(autoload 'css-mode "css-mode" "Cascading Style Sheet editing mode" t)

(setq auto-mode-alist
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))

(setq cssm-indent-function #' cssm-c-style-indenter)
(add-hook 'css-mode-hook
          '(lambda ()
             (define-key cssm-mode-map (read-kbd-macro "\M-j") 'cssm-complete-property)))
(setq cssm-indent-level '2)
