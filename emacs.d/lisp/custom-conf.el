
;; close tool-bar and menu-bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; cancel startup message
(setq inhibit-startup-message t)

;; show current column number and line number on mode line
(column-number-mode)
(line-number-mode)

;; show line number
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
(provide 'custom-conf)
