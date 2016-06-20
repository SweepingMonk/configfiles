;;; package --- Summary
;;; Commentary:
;;; Code:
(require-package 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua$" . lua-mode))

(provide 'init-lua-mode)
;;; init-go-mode.el ends here
