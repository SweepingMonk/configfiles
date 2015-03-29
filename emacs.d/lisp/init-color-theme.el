;; Configuration about color-theme
;;(require-package 'color-theme)
(require-package 'color-theme-molokai)
(require-package 'color-theme-solarized)

;;(require 'color-theme)
;;(color-theme-initialize)

(if (daemonp)
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(progn (select-frame frame)
		       (message "setting-custom-color-theme")
		       (load-theme 'solarized t))))
  (load-theme 'solarized t))

;(when (display-graphic-p)
;  ;; Download several color theme not included in color-theme package
;  (require-package 'color-theme-molokai)
;  (require-package 'color-theme-solarized)
;  (color-theme-solarized-dark))

(provide 'init-color-theme)
