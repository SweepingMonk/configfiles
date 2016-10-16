;;; package --- Summary
;;; Commentary:
;;; Code:
(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq js2-strict-missing-semi-warning nil)
(setq js2-dynamic-idle-timer-ajust 10000)
(setq js2-highlight-level 2)

(provide 'init-js2-mode)
;;; init-js2-mode.el ends here
