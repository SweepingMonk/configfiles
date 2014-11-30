;; configuration about smex 
(require-package 'smex)
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provide a convenient interface to
your recently and most frequently used commands.")

(global-set-key (kbd "M-x") 'smex)

(provide 'init-smex)
