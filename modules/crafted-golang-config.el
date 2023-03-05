;;;; crafted-golang-config.el --- golang configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;;

;;; Code:
(defconst go-tab-width 8)

(defun go//hooks ()
  "Call this when go-mode is enabled."
  (setq-local tab-width go-tab-width)
  (setq-local evil-shift-width go-tab-width))

;; (let ((goimports (executable-find "goimports")))
;;   (if goimports (setq gofmt-command goimports)))

(add-hook 'before-save-hook 'custom/eglot-organize-imports)
(add-hook 'before-save-hook 'eglot-format-buffer)
(add-hook 'go-mode-hook #'eglot-ensure)
(add-hook 'go-mode-hook 'go//hooks)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook #'tree-sitter-hl-mode)

;; Enable folding
(add-hook 'go-mode-hook #'hs-minor-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

(provide 'crafted-golang-config)
;;; crafted-golang-config.el ends here
