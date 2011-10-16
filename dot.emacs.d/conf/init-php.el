;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'php-mode)

(autoload 'php-mode "php-mode" "PHP editing mode" t)

(setq auto-mode-alist
      (cons '("\\.php\\'" . php-mode) auto-mode-alist))

(add-hook 'php-mode-user-hook
            '(lambda ()
               (define-key php-mode-map "\M-j" 'php-complete-function)
               (define-key php-mode-map "\C-m" 'newline-and-indent)
               (c-toggle-auto-hungry-state 1)
               (setq php-manual-path "~/doc/php/html/")
               (setq php-manual-url "http://www.php.net/manual/en/")
               (setq tags-file-name "")))

;; php manual browsing
(defcustom php-manual-url "http://us2.php.net/manual/en/manual.php"
  "*URL at which to find PHP manual. You can replace \"en\" with your
ISO language code."
  :type 'string
  :group 'php)

(defcustom php-search-url "http://us2.php.net/"
  "*URL at which to search for documentation on a word"
  :type 'string
  :group 'php)

(define-key php-mode-map [menu-bar] (make-sparse-keymap))
(define-key php-mode-map [menu-bar php]
  (cons "PHP" (make-sparse-keymap "PHP")))

;; define specific subcommands in this menu.
(define-key php-mode-map
  [menu-bar php browse-manual]
  '("Browse manual" . php-browse-manual))

(define-key php-mode-map
  [menu-bar php search-documentation]
  '("Search documentation" . php-search-documentation))

;; define function documentation function
(defun php-search-documentation ()
  "Search PHP documentation for the word at the point."
  (interactive)
  (browse-url (concat php-search-url (current-word t)))
  )

;; define function for browsing manual
(defun php-browse-manual ()
  "Bring up manual for PHP."
  (interactive)
  (browse-url php-manual-url)
  )

;; define shortcut
(define-key php-mode-map
  "\C-c\C-f"
  'php-search-documentation)

;; define shortcut
(define-key php-mode-map
  "\C-c\C-m"
  'php-browse-manual)
