;;; package --- Summary

;;; Commentary:
;;; some utils

;;; Code:
(defun revert-all-buffers ()
  "Revert all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
	(revert-buffer t t t))))
  (message "Refreshed open files.")
  )

(provide 'utils)
;;; utils.el ends here
