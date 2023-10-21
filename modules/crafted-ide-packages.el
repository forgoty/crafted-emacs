;; crafted-ide-packages.el -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;; Commentary

;; Eglot package installation for Emacs prior to version 29.

;;; Code:

;; editorconfig is a cross-editor/ide configuration tool to control
;; indentation, spaces vs tabs, etc.
(add-to-list 'package-selected-packages 'editorconfig)

;; as most development is done on projects, add ibuffer-project to
;; group project buffers together when listing buffers with ibuffer
(add-to-list 'package-selected-packages 'ibuffer-project)

;; Packages
(add-to-list 'package-selected-packages 'protobuf-ts-mode)

;; Glue between flycheck and eglot
(add-to-list 'package-selected-packages 'flycheck-eglot)

(provide 'crafted-ide-packages)
;;; crafted-ide-packages.el ends here
