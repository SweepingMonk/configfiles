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
(require 'init-powerline)
(require 'init-flycheck)
