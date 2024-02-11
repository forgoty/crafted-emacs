;;;; crafted-custom-tools-config.el --- y           -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; 

;;; Code:

;; Custom tool functions

(defun custom/toggle-flycheck-error-list ()
  "Toggle flycheck's error list window.
If the error list is visible, hide it.  Otherwise, show it."
  (interactive)
  (if-let ((window (flycheck-get-error-list-window)))
      (save-selected-window (quit-window nil window))
    (flycheck-list-errors)))

(defun custom/goto-flycheck-error-list ()
  "Open and go to the error list buffer."
  (interactive)
  (if (flycheck-get-error-list-window)
      (switch-to-buffer flycheck-error-list-buffer)
    (flycheck-list-errors)
    (switch-to-buffer-other-window flycheck-error-list-buffer)))

(setq consult-ripgrep-args
  "/bin/rg --null --line-buffered --color=never --max-columns=1000 --path-separator /\
   --smart-case --no-heading --with-filename --line-number --hidden --glob \"!{.git,node_modules,vendor,.venv}/*\"")

(add-to-list 'vc-directory-exclusion-list "vendor")
(add-to-list 'vc-directory-exclusion-list ".venv")
(add-to-list 'vc-directory-exclusion-list "node_modules")

;; Custom advice
(advice-add #'project-find-regexp :override 'consult-ripgrep)


(provide 'crafted-custom-tools-config)
;;; crafted-custom-tools-config.el ends here
