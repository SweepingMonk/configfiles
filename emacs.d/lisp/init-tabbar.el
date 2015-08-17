;; Configuration about tabbar
(require-package 'tabbar)
(require 'tabbar )

;; Key-binding settings
(global-set-key (kbd "M-p") 'tabbar-backward)
(global-set-key (kbd "M-n") 'tabbar-forward)

(setq tabbar-use-images nil)
;;设置tabbar的外观
;;设置默认主题：字体，前景和背景色，大小
(defun custom-tabbar-face ()
  (progn
    (set-face-attribute 'tabbar-default nil
			:background (face-attribute 'mode-line-inactive :background)
			:foreground (face-attribute 'mode-line-inactive :foreground)
			:height 0.8)
    (set-face-attribute 'tabbar-selected nil
			:background (face-attribute 'mode-line :background)
			:foreground (face-attribute 'mode-line :foreground))
    (set-face-attribute 'tabbar-unselected nil
			:background (face-attribute 'mode-line-inactive :background)
			:foreground (face-attribute 'mode-line-inactive :foreground))
    ))

(if (daemonp)
    (add-hook 'after-make-frame-functions
	     (lambda (frame)
	       (progn (select-frame frame)
		      (custom-tabbar-face))))
  (custom-tabbar-face))

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))

;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
		    (format "[%s]  " (tabbar-tab-tabset tab))
		  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
	label
      (tabbar-shorten
       label (max 1 (/ (window-width)
		       (length (tabbar-view
				(tabbar-current-tabset)))))))))

;; change tab bar group function
;(setq tabbar-buffer-groups-function
;      (lambda ()
;	(let ((dir (expand-file-name default-directory)))
;	  (cond ((member (buffer-name) '("*Completions*"
;					 "*scratch*"
;					 "*Messages*"
;					 "*Ediff Registry*"))
;		 (list "#misc"))
;		((string-match-p "/.emacs.d/" dir)
;		 (list ".emacs.d"))
;		(t (list dir))))))

(tabbar-mode 1)

(provide 'init-tabbar)
