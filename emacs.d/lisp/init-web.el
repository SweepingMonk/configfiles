;; Configuration about web mode

(require-package 'web-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-engines-alist
      '(("django" . "\\.html?\\'")))

(add-hook 'web-mode-hook
	  (lambda ()
	    (setq web-mode-markup-indent-offset 2)
	    (setq web-mode-code-indent-offset 4)
	    (setq web-mode-css-indent-offset 2)
	    (setq web-mode-style-padding 2)
	    (setq web-mode-script-padding 2)))

;; highlight the current element
(setq web-mode-enable-current-element-highlight t)
;; enable auto pairing
;;(setq web-mode-enable-auto-pairing t)
(provide 'init-web)
