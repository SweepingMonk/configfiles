;;; package --- elpa config
;;; Commentary:

;;; Code:
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; on-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  (if (package-installed-p package min-version)
      t
    (if no-refresh
	(package-install package)
      (progn
	(package-refresh-contents)
	(package-install package)))))

(provide 'init-elpa)

;;; init-elpa.el ends here

