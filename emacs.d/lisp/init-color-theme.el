;;; Package --- config of color theme
;;; Commentary:
;;; Code:

(require-package 'color-theme-solarized)

;;(require 'color-theme)
;;(color-theme-initialize)

(defvar my-color-theme 'solarized)

;;; font family setting
(defvar default-font-family)
(cond
 ((string-equal system-type "windows-nt") (setq default-font-family "Consolas"))
 ((string-equal system-type "darwin") (setq default-font-family "Monaco"))
 ((string-euqal system-type "gnu/linux") (setq default-font-family "Liberation Mono")))
(defvar prefer-font-family "Inconsolata")
(defvar x-font-family (if (member prefer-font-family (font-family-list))
			  prefer-font-family default-font-family ))

;;; font size setting
(defvar x-font-size 16)

;; using Hiragino Sans GB font to render chinese character
(set-fontset-font "fontset-default"
		  'han
		  (font-spec :family "Hiragino Sans GB" :size 14))
(set-fontset-font "fontset-default"
		  'cjk-misc
		  (font-spec :family "Hiragino Sans GB" :size 14))

(defun graphic-frame-action (frame)
  (set-frame-parameter frame 'background-mode 'light)
  (set-frame-parameter frame 'width 115)
  (set-frame-parameter frame 'height 38)
  (set-frame-parameter frame 'left 200)
  (set-frame-parameter frame 'top 40)
  (set-frame-parameter frame 'font (format "%s-%d" x-font-family x-font-size))
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
