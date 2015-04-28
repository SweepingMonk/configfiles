;; Configuration about color-theme
;;(require-package 'color-theme)
(require-package 'color-theme-molokai)
(require-package 'color-theme-solarized)

;;(require 'color-theme)
;;(color-theme-initialize)

(defun graphic-frame-action (frame)
  (set-frame-parameter frame 'background-mode 'dark)
  (set-frame-parameter frame 'fullscreen 'fullboth)
  (set-frame-parameter frame 'font "Monaco-13")
  (enable-theme 'molokai))

(defun terminal-frame-action (frame)
  (set-terminal-parameter frame 'background-mode 'dark)
  (enable-theme 'molokai))

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
(load-theme 'molokai t)
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
