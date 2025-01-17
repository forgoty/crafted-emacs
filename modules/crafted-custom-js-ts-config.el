;;;; crafted-custom-js-ts-config.el --- Configuration of js-ts languages  -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; 

;;; Code:

;; Pre-save hooks

(add-hook 'typescript-ts-mode-hook #'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'flycheck-mode)

;; Enable folding
(add-hook 'typescript-ts-mode-hook #'hs-minor-mode)

(provide 'crafted-custom-js-ts-config)
;;; crafted-custom-js-ts-config.el ends here
