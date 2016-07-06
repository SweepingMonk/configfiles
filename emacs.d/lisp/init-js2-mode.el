;;; package --- Summary
;;; Commentary:
;;; Code:
(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(provide 'init-js2-mode)
;;; init-js2-mode.el ends here
