;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; minibuffer completion
(require 'mcomplete)
(turn-on-mcomplete-mode)

;; buffer switch
(iswitchb-mode t)

;;(iswitchb-default-keybindings)
(add-hook 'iswitchb-define-mode-map-hook
          'iswitchb-my-keys)

(defun iswitchb-my-keys ()
  "Add my keybindings for iswitchb."
  (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
  (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
  (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
  (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)
  (define-key iswitchb-mode-map " " 'iswitchb-next-match)
  )
(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  "Selected bufffer show window."
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))
