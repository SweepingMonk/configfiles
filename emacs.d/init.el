;; add lisp directory to load path
(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))

;; close tool-bar-mode
(tool-bar-mode 0)
(menu-bar-mode 1)
(setq inhibit-startup-message t)
(column-number-mode)
(line-number-mode)
(global-linum-mode)
(setq make-backup-files nil)
(setq show-paren-mode t)

;; initialize installed packages
(require 'init-elpa)
(require 'init-color-theme)
(require 'init-smex)
(require 'init-evil)
(require 'init-yasnippet)
(require 'init-tabbar)
(require 'init-web)
;(require 'init-powerline)

