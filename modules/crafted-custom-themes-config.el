;;;; crafted-custom-themes-config.el --- configure themes for emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;;

;;; Code:
;; Theme
(load-theme 'doom-gruvbox t)

;; Modeline
(doom-modeline-mode t)
(setq doom-modeline-highlight-modified-buffer-name t
      doom-modeline-height 15
      doom-modeline-bar-width 6
      doom-modeline-lsp t
      doom-modeline-github nil
      doom-modeline-mu4e nil
      doom-modeline-irc nil
      doom-modeline-persp-name nil
      doom-modeline-persp-icon nil
      doom-modeline-env-version nil
      doom-modeline-gnus nil
      doom-modeline-buffer-encoding t
      doom-modeline-buffer-file-name-style 'relative-from-project
      doom-modeline-major-mode-icon nil)

;; Enable window numbers in modeline
(winum-mode)

(provide 'crafted-custom-themes-config)
;;; crafted-custom-themes-config.el ends here
