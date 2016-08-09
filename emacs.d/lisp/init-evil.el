;;; package --- Summary
;;; Commentary:
;; Configuration about evil (extended vi layer for Emacs)

;;; Code:
(require-package 'evil)
(require-package 'evil-surround)
(require 'evil)
(require 'evil-surround)
(evil-mode 1)
(global-evil-surround-mode 1)

(provide 'init-evil)
;;; init-evil ends here
