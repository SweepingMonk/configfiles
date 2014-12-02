;; Configuration about color-theme
(require-package 'color-theme)
(require-package 'color-theme-molokai)
(require-package 'color-theme-solarized)

(require 'color-theme)
(color-theme-initialize)
(color-theme-solarized-dark)
;(when (display-graphic-p)
;  ;; Download several color theme not included in color-theme package
;  (require-package 'color-theme-molokai)
;  (require-package 'color-theme-solarized)
;  (color-theme-solarized-dark))

(provide 'init-color-theme)
