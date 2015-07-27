
;; Configuration about web mode

(require-package 'flycheck)
(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-check-syntax-automatically '(mode-enabled save))

(provide 'init-flycheck)
