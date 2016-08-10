;;; package --- Summary
;; Configuration of smart mode line
;;; Commentary:
;;; Code:

(require-package 'smart-mode-line)
(require 'smart-mode-line)

(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)

(provide 'init-smart-mode-line)
;;; init-smart-mode-line ends here
