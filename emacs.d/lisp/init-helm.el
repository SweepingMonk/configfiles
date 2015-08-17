;;; package --- configuration of helm
(require-package 'helm)
(require 'helm-config )

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(provide 'init-helm)
