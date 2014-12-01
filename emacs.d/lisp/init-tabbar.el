;; Configuration about tabbar
(require-package 'tabbar)
(require 'tabbar )
(tabbar-mode 1)

;; Key-binding settings
(global-set-key (kbd "M-p") 'tabbar-backward)
(global-set-key (kbd "M-n") 'tabbar-forward)

;;设置tabbar的外观
;;设置默认主题：字体，前景和背景色，大小
(set-face-attribute 'tabbar-default nil
		    :family "Monospace"
		    :background "#gray80"
		    :foreground "#gray30"
		    :height 1.0
		    )

(set-face-attribute 'tabbar-button nil
		    :inherit 'tabbar-default
		    :foreground "#FDF6E3"
		    :background "#657A83"
		    )

(set-face-attribute 'tabbar-selected nil
		    :inherit 'tabbar-default
		    :foreground "#FDF6E3"
		    :background "#657A83"
		    :weight 'bold
		    )

(provide 'init-tabbar)
