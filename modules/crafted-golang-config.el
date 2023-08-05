;;;; crafted-golang-config.el --- golang configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;;

;;; Code:
(defconst go-tab-width 8)

(defun go-packages ()
  "Return a list of all Go packages, using `go list'."
  (process-lines "go" "list" "-e" "all"))

(defun go-goto-imports ()
  "Move point to the block of imports."
  (interactive)
  ;; FIXME if there's a block-commented import before the real
  ;; imports, we'll jump to that one.

  ;; Generally, this function isn't very forgiving. it'll bark on
  ;; extra whitespace. It works well for clean code.
  (let ((old-point (point)))
    (goto-char (point-min))
    (cond
     ((re-search-forward "^import ()" nil t)
      (backward-char 1)
      'block-empty)
     ((re-search-forward "^import ([^)]+)" nil t)
      (backward-char 2)
      'block)
     ((re-search-forward "\\(^import \\([^\"]+ \\)?\"[^\"]+\"\n?\\)+" nil t)
      'single)
     ((re-search-forward "^[[:space:]\n]*package .+?\n" nil t)
      (message "No imports found, moving point after package declaration")
      'none)
     (t
      (goto-char old-point)
      (message "No imports or package declaration found. Is this really a Go file?")
      'fail))))

(defun go-import-add (arg import)
  "Add a new IMPORT to the list of imports."
  ;; - If there's a matching `// import "foo"`, uncomment it
  ;; - If we're in an import() block and there's a matching `"foo"`, uncomment it
  ;; - Otherwise add a new import, with the appropriate syntax
  (interactive
   (list
    current-prefix-arg
    (replace-regexp-in-string "^[\"']\\|[\"']$" "" (completing-read "Package: " (go-packages)))))
  (save-excursion
    (let (as line import-start)
      (if arg
          (setq as (read-from-minibuffer "Import as: ")))
      (if as
          (setq line (format "%s \"%s\"" as import))
        (setq line (format "\"%s\"" import)))

      (goto-char (point-min))
      (if (re-search-forward (concat "^[[:space:]]*//[[:space:]]*import " line "$") nil t)
          (uncomment-region (line-beginning-position) (line-end-position))
        (cl-case (go-goto-imports)
          (fail (message "Could not find a place to add import."))
          (block-empty
           (insert "\n\t" line "\n"))
          (block
              (save-excursion
                (re-search-backward "^import (")
                (setq import-start (point)))
            (if (re-search-backward (concat "^[[:space:]]*//[[:space:]]*" line "$")  import-start t)
                (uncomment-region (line-beginning-position) (line-end-position))
              (insert "\n\t" line)))
          (single (insert "import " line "\n"))
          (none (insert "\nimport (\n\t" line "\n)\n")))))))

(defun go//hooks ()
  "Call this when go-ts-mode is enabled."
  (setq-local tab-width go-tab-width)
  (setq-local evil-shift-width go-tab-width)
  (add-hook 'before-save-hook (lambda ()
                                (call-interactively #'eglot-format-buffer)
                                (call-interactively #'eglot-code-action-organize-imports))))

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

(add-hook 'go-ts-mode-hook 'go//hooks)
(add-hook 'go-ts-mode-hook #'eglot-ensure)


;; Flycheck
(add-hook 'go-ts-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck                                       
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))


;; Enable folding
(add-hook 'go-ts-mode-hook #'hs-minor-mode)

(provide 'crafted-golang-config)
;;; crafted-golang-config.el ends here
