;; Configuration about color-theme
;;(require-package 'color-theme)
(require-package 'molokai-theme)
(require-package 'color-theme-solarized)

;;(require 'color-theme)
;;(color-theme-initialize)
(setq my-color-theme 'solarized)

(defun graphic-frame-action (frame)
  (set-frame-parameter frame 'background-mode 'light)
  (set-frame-parameter frame 'width 100)
  (set-frame-parameter frame 'height 40)
  (set-frame-parameter frame 'left 200)
  (set-frame-parameter frame 'top 40)
  (set-frame-parameter frame 'font "Monaco-13")
  (enable-theme my-color-theme))

(defun terminal-frame-action (frame)
  (set-terminal-parameter frame 'background-mode 'dark)
  (enable-theme my-color-theme))

(defun add-make-frame-hook ()
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(if (display-graphic-p frame)
		    (graphic-frame-action frame)
		  (terminal-frame-action frame)))))

(defun normal-action ()
  (if (display-graphic-p nil) (graphic-frame-action nil) (terminal-frame-action nil))
  (add-make-frame-hook))

;; load the theme
(load-theme my-color-theme t)
(if (daemonp) (add-make-frame-hook) (normal-action))
;(add-hook 'after-make-frame-functions
;	  (lambda (frame)
;	    (progn (message "enable theme")
;		   (set-frame-parameter frame 'background-mode 'dark)
;		   (enable-theme 'solarized))))

;(add-to-list 'default-frame-alist '(font . "Monaco-14"))
;(when (display-graphic-p)
;  ;; Download several color theme not included in color-theme package
;  (require-package 'color-theme-molokai)
;  (require-package 'color-theme-solarized)
;  (color-theme-solarized-dark))

(provide 'init-color-theme)
;;; init-color-theme.el ends here
