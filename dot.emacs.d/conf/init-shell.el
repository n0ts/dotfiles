;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; eshell
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(eshell-ask-to-save-history (quote always))
 '(eshell-glob-include-dot-dot nil)
 '(eshell-history-size 1000)
 '(eshell-ls-dired-initial-args (quote ("-h")))
 '(eshell-ls-exclude-regexp "~\\'")
 '(eshell-ls-initial-args "-h")
 '(eshell-ls-use-in-dired t nil (em-ls))
 '(eshell-modules-list (quote (eshell-alias eshell-basic eshell-cmpl eshell-dirs eshell-glob eshell-hist eshell-ls eshell-pred eshell-prompt eshell-rebind eshell-script eshell-smart eshell-term eshell-unix eshell-xtra)))
 '(eshell-prefer-to-shell t nil (eshell))
 '(eshell-stringify-t nil)
 '(eshell-term-name "ansi")
 '(eshell-visual-commands (quote ("vi" "top" "screen" "less" "lynx" "ssh" "rlogin" "telnet")))
 '(icicle-reminder-prompt-flag 0))

(add-hook 'eshell-mode-hook
   '(lambda nil
      (local-set-key "\C-a" 'eshell-bol)
      (local-set-key "\C-u" 'eshell-kill-input))
 )

(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/less (&rest args)
 "Invoke `view-file' on the file.
\"less +42 foo\" also goes to line 42 in the buffer."
 (while args
   (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
       (let* ((line (string-to-number (match-string 1 (pop args))))
              (file (pop args)))
         (view-file file)
         (goto-line line))
     (view-file (pop args)))))

(defun eshell-cd-default-directory ()
  (interactive)
  (let ((dir default-directory))
    (eshell)
    (cd dir)
    (eshell-interactive-print (concat "cd " dir "\n"))
    (eshell-emit-prompt)))
