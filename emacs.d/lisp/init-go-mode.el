;;; package --- Summary
;;; Commentary:
;;; Code:
(require-package 'go-mode)
(require 'go-mode-autoloads)

(add-hook 'go-mode-hook
	  (lambda ()
	    (setq tab-width 4)))

(provide 'init-go-mode)
;;; init-go-mode.el ends here
