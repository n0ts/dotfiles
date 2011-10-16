;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; hide menu-bar & tool-bar
(menu-bar-mode nil)
(when window-system
  (tool-bar-mode nil))

;; title-bar
(setq frame-title-format 
  (format "Emacs@%s : %%f" (system-name)))

;; default frame style
(setq default-frame-alist
  (append (list
    '(top . 20)
    '(left . 0)
    '(width . 100)
    '(height . 45)
    '(foreground-color . "white")
    '(background-color . "black")
    '(border-color . "black")
    '(mouse-color . "black")
    '(cursor-type . box)
    '(cursor-color . "lavender")
    '(cursor-height . 4)
    '(vertical-scroll-bars . nil)
    '(scroll-bar-width . 16)
   )
  default-frame-alist))

;; mode-line
(remove-hook 'global-mode-string 'display-time-string)
(setq-default mode-line-format
  '("-"
    mode-line-mule-info
    mode-line-modified
    mode-line-frame-identification
    mode-line-buffer-identification
    "    %p ("
    (line-number-mode "%l")
    ","
    (column-number-mode "%c")
    ") "
    " %[(" mode-name
           mode-line-process
           minor-mode-alist
           "%n"
     ")%]----"
    (which-func-mode ("" which-func-format "-"))
    global-mode-string
    "-%-")
)

;; show clock
(setq display-time-string-forms
   '(24-hours ":" minutes ", "
     month "/" day "/" year))
(display-time)

;; mouse cursor
(mouse-avoidance-mode 'exile)
