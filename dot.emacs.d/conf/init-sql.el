;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; sql-mode
(autoload 'sql-mode "sql" "SQL Edit mode" t)
(autoload 'master-mode "master" "Master mode minor mode." t)

(eval-after-load "sql"
  (progn
     (load-library "sql-indent")
     (load-library "sql-complete")
     (load-library "sql-transform")
     ))

(add-hook 'sql-mode-hook
          '(lambda ()
             (abbrev-mode t)
             (local-set-key "\C-cu" 'sql-to-update) ; sql-transform
             (master-mode t)
             (master-set-slave sql-buffer)
             (font-lock-add-keywords
              major-mode
              '(
                ("^\\([a-zA-Z0-9_@-]*> \\)+" 1 font-lock-constant-face t)
                ("'[^']*'"  . font-lock-string-face)
                ("\\\"[^\\\"]*\\\"" . font-lock-string-face)
                ("--.*" 0 font-lock-comment-face t)
                ("/\\*.*\\*/" 0 font-lock-comment-face t)
                ("^rem\\([ \t].*\\)?$" 0 font-lock-comment-face t)
                ("^prompt\\([ \t].*\\)?$" 0 font-lock-comment-face t)))
             ))
(add-hook 'sql-set-sqli-hook
          '(lambda ()
	     (master-set-slave sql-buffer)))
(add-hook 'sql-interactive-mode-hook
          '(lambda ()
             (abbrev-mode t)
             (setq sql-alternate-buffer-name (concat sql-alternate-buffer-name "@" sql-server))
             (setq mode-line-process '(":%s[" sql-alternate-buffer-name "]"))
             (sql-rename-buffer)
             (setq sql-electric-stuff 'semicolon)
             (setq comint-buffer-maximum-size 500)
             (setq comint-input-autoexpand t)
             (setq comint-output-filter-functions
		   'comint-truncate-buffer)))

(defadvice sql-send-region (after sql-store-in-history)
  "The region sent to the SQLi process is also stored in the history."
  (let ((history (buffer-substring-no-properties start end)))
    (save-excursion
      (set-buffer sql-buffer)
      (message history)
      (if (and (funcall comint-input-filter history)
               (or (null comint-input-ignoredups)
                   (not (ring-p comint-input-ring))
                   (ring-empty-p comint-input-ring)
                   (not (string-equal (ring-ref comint-input-ring 0)
                                      history))))
          (ring-insert comint-input-ring history))
      (setq comint-save-input-ring-index comint-input-ring-index)
      (setq comint-input-ring-index nil))))
(ad-activate 'sql-send-region)

(setq sql-user "")
(setq sql-password "")
(setq sql-server "localhost")
(setq sql-database "mysql")

;; abbrev table
(define-abbrev-table
  'sql-mode-abbrev-table
  '(
    ("a"    "and" nil)
    ("ad"   "add datafile" nil)
    ("af"   "* from" nil)
    ("al"   "alter" nil)
    ("be"   "between and " (lambda()(backward-char 5)))
    ("c"    "count(*)" nil)
    ("co"   "commit" nil)
    ("col"  "columns" nil)
    ("cr"   "create" nil)
    ("d"    "" (lambda()(insert (format-time-string "'%y-%m-%d'" (current-time)))))
    ("de"   "describe" nil)
    ("dd"   "DBA_DATA_FILES" nil)
    ("df"   "DBA_FREE_SPACE" nil)
    ("dp"   "DBA_PROFILES" nil)
    ("dr"   "DBA_ROLLBACK_SEGS" nil)
    ("du"   "DBA_USERS" nil)
    ("e"    "exit" nil)
    ("f"    "from" nil)
    ("g"    "group by" nil)
    ("ha"   "having" nil)
    ("i"    "insert" nil)
    ("inte" "intersect" nil)
    ("l"    "like" nil)
    ("m"    "minus" nil)
    ("n"    "null" nil)
    ("o"    "order by" nil)
    ("q"    "quit" nil)
    ("r"    "rownum<=10" nil)
    ("ro"   "rollback" nil)
    ("s"    "select" nil)
    ("sh"   "show" nil)
    ("t"    "tablespace" nil)
    ("tn"   "TABLESPACE_NAME" nil)
    ("u"    "update" nil)
    ("uc"   "USER_CONSTRAINTS" nil)
    ("ud"   "USER_DB_LINKS" nil)
    ("ui"   "USER_IND_COLUMNS" nil)
    ("un"   "union" nil)
    ("una"  "union all" nil)
    ("us"   "USER_SEGMENTS" nil)
    ("uv"   "USER_VIEWS" nil)
    ("vp"   "v$parameter" nil)
    ("vsp"  "v$system_parameter" nil)
    ("w"    "where" nil)))
