;;;; crafted-custom-search-config.el --- y           -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; 

;;; Code:
(with-eval-after-load 'rg
  (rg-enable-default-bindings)
  (rg-define-search rg-custom-search
    :format regexp
    :files "everything"
    :flags ("--hidden")
    :dir project
    )
)
(provide 'crafted-custom-search-config)
;;; crafted-custom-search-config.el ends here
