
;; Configuration about web mode

(require-package 'flycheck)
(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-check-syntax-automatically '(mode-enabled save))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (progn
	      (setq flycheck-gcc-language-standard "c++11")
	      (setq flycheck-clang-language-standard "c++11"))))


(with-eval-after-load "flycheck"
  (setq-default flycheck-disabled-checkers
		(if (boundp 'flychecker-disabled-checkers)
		  (append flychecker-disabled-checkers '(emacs-lisp-checkdoc))
		  '(emacs-lisp-checkdoc))))

(provide 'init-flycheck)
