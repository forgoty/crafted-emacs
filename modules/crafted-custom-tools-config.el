;;;; crafted-custom-tools-config.el --- y           -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; 

;;; Code:

;; Custom tool functions
(with-eval-after-load 'rg
  (rg-enable-default-bindings)
  (rg-define-search custom/rg-custom-search
    :format regexp
    :files "everything"
    :flags ("--hidden")
    :dir project
    )
)

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

;; Custom advices
(advice-add #'project-find-regexp :override 'consult-ripgrep)

(provide 'crafted-custom-tools-config)
;;; crafted-custom-tools-config.el ends here
