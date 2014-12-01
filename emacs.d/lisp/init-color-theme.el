;; Configuration about color-theme
(require-package 'color-theme)
(require-package 'color-theme-molokai)

(require 'color-theme)
(color-theme-initialize)
(when (display-graphic-p)
    (color-theme-molokai))

(provide 'init-color-theme)
