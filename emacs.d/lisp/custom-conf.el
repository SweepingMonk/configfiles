
;; close tool-bar and menu-bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; cancel startup message
(setq inhibit-startup-message t)

;; show current column number and line number on mode line
(column-number-mode)
(line-number-mode)

;; show line number
(unless window-system
  (add-hook 'linum-before-numbering-hook
	    (lambda ()
	      (setq-local linum-format-fmt
			  (let ((w (length (number-to-string
					    (count-lines (point-min) (point-max))))))
			    (concat "%" (number-to-string w) "d"))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'linum)))

(unless window-system
  (setq linum-format 'linum-format-func))

(global-linum-mode)

;; cancel making backup file
(setq make-backup-files nil)

;;show matched parenthesis
(show-paren-mode t)

;;auto revert when the file has been updated
(global-auto-revert-mode t)

;; auto-complete pair like qoute, perenthesis
(electric-pair-mode t)

;; highlight current line
(global-hl-line-mode t)

;;cc mode setting
(setq c-default-style "linux"
      c-basic-offset 4)

(define-coding-system-alias 'utf8 'utf-8)
(define-coding-system-alias 'UTF-8 'utf-8)

;; save the last position of edited file
(require 'saveplace)
(setq-default sava-place t)
(setq save-place-file "~/.emacs.d/saved-places")
(provide 'custom-conf)
