;; Configuration about haskell mode
(require-package 'haskell-mode)
(require 'haskell-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(provide 'init-haskell)
;;; init-haskell.el ends here
