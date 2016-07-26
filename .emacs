;; .emacs

;;(set-language-environment "japanese")
;;(prefer-coding-system `utf-8)
;;(set-terminal-coding-system `utf-8)
;;(set-keyboard-coding-system `utf-8)
;;(set-buffer-file-coding-system `utf-8)
;;(set-default-coding-systems `utf-8)


;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

(load-library "php-mode") 
(require 'php-mode)
(add-hook 'php-mode-hook 
	  '(lambda () 
	     (setq c-basic-offset 4)
	     (setq c-tab-width 4) 
	     (setq c-indent-level 4) 
	     (setq tab-width 4) 
	     (setq indent-tabs-mode t)
	     (setq-default tab-width 8)
	     )
	  )

;; svn-commit.tmp~ をつくりたくねー
(defun starts-with-p (string1 string2)
  (string= (substring string1 0 (min (length string1)
				     (length string2)))
	   string2))

(defun dont-backup-commit-files-p (filename)
  (let ((filename-part (file-name-nondirectory filename)))
    (if (or (starts-with-p filename-part "svn-commit")
            (starts-with-p filename-part "svn-prop"))
        nil
      (normal-backup-enable-predicate filename))))

(setq backup-enable-predicate 'dont-backup-commit-files-p)
