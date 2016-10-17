;; add lisp directory to load path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))

;;load custome configuration
(require 'utils)
(require 'custom-conf)

;; initialize installed packages
(require 'init-elpa)
(require 'init-color-theme)
(require 'init-smex)
(require 'init-evil)
(require 'init-yasnippet)
;(require 'init-tabbar)
(require 'init-web)
;(require 'init-powerline)
(require 'init-flycheck)
(require 'init-helm)
(require 'init-org)
(require 'init-haskell)
(require 'init-go-mode)
(require 'init-js2-mode)
(require 'init-smart-mode-line)
(require 'init-markdown-mode)
