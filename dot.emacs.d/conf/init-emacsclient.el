;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; emacsclient with elscreen
(require 'server)

(defvar server-edit-file-coding-system-alist nil
  "*A alist of file name REGEXP to CODING-SYSTEM for server edit.
If file name is matched by REGEXP, file coding-system is decied to CODING-SYSTEM.")

(defvar server-edit-screen nil)

(defun server-edit-visit ()
  (local-set-key "\C-c\C-c" 'server-edit)
  (local-set-key "\C-c\C-k" 'server-edit-cancel)
  (setq mode-line-buffer-identification
        (append mode-line-buffer-identification
                (list
                 (propertize " [SERVER]" 'face 'mode-line-buffer-id))))
  (let ((cs (cdr
             (assoc-if (lambda (re) (string-match re buffer-file-name))
                       server-edit-file-coding-system-alist)))
        (mod (buffer-modified-p)))
    (when cs
      (encode-coding-region (point-min) (point-max) buffer-file-coding-system)
      (decode-coding-region (point-min) (point-max) cs)
      (set-buffer-modified-p mod)
      (set-buffer-file-coding-system cs nil t)))
  (when (fboundp 'elscreen-find-and-goto-by-buffer)
    (set (make-local-variable 'server-edit-screen)
         (elscreen-find-and-goto-by-buffer (current-buffer) 'create))
    (elscreen-notify-screen-modification 'force-immediately))
  (add-hook 'server-done-hook 'server-edit-done nil t))

(add-hook 'server-visit-hook 'server-edit-visit)
  
(defun server-edit-cancel (&optional arg)
  (interactive "P")
  (when (y-or-n-p (concat "Cancel file " buffer-file-name "? "))
    (set-buffer-modified-p nil)
    (server-edit arg)))

(defun server-edit-done ()
  (when (file-exists-p buffer-file-name)
    (set-file-times buffer-file-name (current-time)))
  (when (and (fboundp 'elscreen-kill)
             server-edit-screen
             (= server-edit-screen (elscreen-get-current-screen)))
    (elscreen-kill)))

(server-mode 1)
