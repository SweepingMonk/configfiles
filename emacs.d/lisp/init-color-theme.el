;;; Package --- config of color theme
;;; Commentary:
;;; Code:

(require-package 'color-theme-solarized)

(defvar my-color-theme 'solarized)

(defun graphic-frame-action (frame)
  "Graphic frame action, FRAME is the selected frame."
  (let* ((default-font-family (cond
			       ((string-equal system-type "windows-nt") "Consolas")
			       ((string-equal system-type "darwin") "Monaco")
			       ((string-equal system-type "gnu/linux") "Liberation Mono")))
	 (prefer-font-family "Inconsolata")
	 (x-font-family (if (member prefer-font-family (font-family-list))
			    prefer-font-family default-font-family))
	 (x-font-size 16)
	 (chinese-font-family (cond
			       ((string-equal system-type "windows-nt") "Microsoft Yahei")
			       ((string-equal system-type "darwin") "Hiragino Sans GB")
			       ((string-equal system-type "gnu/linux") "Microsoft Yahei"))))
    (set-fontset-font "fontset-default"
		      'han
		      (font-spec :family chinese-font-family :size 14))
    (set-fontset-font "fontset-default"
		      'cjk-misc
		      (font-spec :family chinese-font-family :size 14))
    (set-frame-parameter frame 'background-mode 'light)
    (set-frame-parameter frame 'width 115)
    (set-frame-parameter frame 'height 38)
    (set-frame-parameter frame 'left 200)
    (set-frame-parameter frame 'top 40)
    (set-frame-parameter frame 'font (format "%s-%d" x-font-family x-font-size)))
  (enable-theme my-color-theme))

(defun terminal-frame-action (frame)
  "Terminal frame action, FRAME is the selected frame."
  (set-frame-parameter frame 'background-mode 'dark)
  (set-terminal-parameter frame 'background-mode 'dark)
  (enable-theme my-color-theme))

(defun add-make-frame-hook ()
  "When Emacs is in daemon mode, add make frame hook to do different action."
  (add-hook 'after-make-frame-functions
	    (lambda (frame)
	      (if (display-graphic-p frame)
		  (graphic-frame-action frame)
		(terminal-frame-action frame)))))

(defun normal-action ()
  "When Emacs is in normal mode(opend by command), do actions then add make frame-hook."
  (if (display-graphic-p nil) (graphic-frame-action nil) (terminal-frame-action nil))
  (add-make-frame-hook))

;; load the theme
(load-theme my-color-theme t)
(if (daemonp) (add-make-frame-hook) (normal-action))

(provide 'init-color-theme)
;;; init-color-theme.el ends here
