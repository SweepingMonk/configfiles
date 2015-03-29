;; add lisp directory to load path
(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))

;;load custome configuration
(require 'custom-conf)

;; initialize installed packages
(require 'init-elpa)
(require 'init-color-theme)
(require 'init-smex)
(require 'init-evil)
(require 'init-yasnippet)
(require 'init-tabbar)
(require 'init-web)
;(require 'init-powerline)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
