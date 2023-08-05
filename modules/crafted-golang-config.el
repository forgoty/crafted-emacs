;;;; crafted-golang-config.el --- golang configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;;

;;; Code:
(defconst go-tab-width 8)

(defun go//hooks ()
  "Call this when go-ts-mode is enabled."
  (setq-local tab-width go-tab-width)
  (setq-local evil-shift-width go-tab-width))
  (add-hook 'before-save-hook 'eglot-format-buffer)
  (add-hook 'before-save-hook 'custom/eglot-organize-imports)


(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

;; eglot configuration
(setq eglot-workspace-configuration
      '((:gopls .
                ((buildFlags . ["-tags=unit,integration"])
                 ))))

;; Associated go files with go-ts-mode
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))

;; Find project
(add-hook 'project-find-functions #'project-find-go-module)

(add-hook 'go-ts-mode-hook #'eglot-ensure)
(add-hook 'go-ts-mode-hook 'go//hooks)

;; Flycheck
(add-hook 'go-ts-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck                                       
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))


;; Enable folding
(add-hook 'go-ts-mode-hook #'hs-minor-mode)

(provide 'crafted-golang-config)
;;; crafted-golang-config.el ends here
