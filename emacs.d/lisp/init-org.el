;;; Package --- config of color theme
;;; Commentary:
;;; Code:
(setq org-startup-indented t)
(setq org-startup-truncated nil)
(setq org-src-fontify-natively t)

(eval-after-load "org"
  '(require 'ox-md nil t))

(provide 'init-org)
;;; init-org.el ends here
