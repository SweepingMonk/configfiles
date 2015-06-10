
;; Configuration about web mode

(require-package 'flycheck)
(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-flycheck)
