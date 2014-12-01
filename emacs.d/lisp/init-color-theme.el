;; Configuration about color-theme
(require-package 'color-theme)

(require 'color-theme)
(color-theme-initialize)
(when (display-graphic-p)
  ;; Download several color theme not included in color-theme package
  (require-package 'color-theme-molokai)
  (require-package 'color-theme-solarized)
  (color-theme-solarized-dark))

(provide 'init-color-theme)
