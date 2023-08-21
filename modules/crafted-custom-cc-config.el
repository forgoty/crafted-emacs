;;;; crafted-custom-cc-config.el --- C configuration  -*- lexical-binding: t; -*-

;;; Code:
(defun c//hooks ()
  "Call this when c-ts-mode is enabled."
  (add-hook 'before-save-hook (lambda ()
                                (call-interactively #'eglot-format-buffer)
                                (call-interactively #'eglot-code-action-organize-imports))))


;; Remap c-mode to c-ts-mode
(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
(add-to-list 'major-mode-remap-alist
              '(c-or-c++-mode . c-or-c++-ts-mode))


(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook 'c//hooks)

;; Flycheck
(add-hook 'c-ts-mode-hook 'flycheck-mode)

(flycheck-define-checker c/c++-cppcheck
  "A C/C++ checker using cppcheck.

See URL `http://cppcheck.sourceforge.net/'."
  :command ("cppcheck" "--quiet" "--xml-version=2" "--inline-suppr"
            (option "--enable=" flycheck-cppcheck-checks concat
                    flycheck-option-comma-separated-list)
            (option-flag "--inconclusive" flycheck-cppcheck-inconclusive)
            (option-list "-I" flycheck-cppcheck-include-path)
            (option-list "--std=" flycheck-cppcheck-standards concat)
            (option-list "--suppress=" flycheck-cppcheck-suppressions concat)
            (option "--suppressions-list="
                    flycheck-cppcheck-suppressions-file concat)
            "-x" (eval
                  (pcase major-mode
                    ((or `c++-mode `c++-ts-mode) "c++")
                    ((or `c-mode `c-ts-mode) "c")))
            source)
  :error-parser flycheck-parse-cppcheck
  :modes (c-mode c++-mode c-ts-mode c++-ts-mode))

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-cppcheck
                                '(warning . c/c++-googlelint))))

;; Enable folding
(add-hook 'c-ts-mode-hook 'hs-minor-mode)

;; Default language server is ccls for c-ts-mode
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(c-ts-mode . ("ccls"))))

(provide 'crafted-custom-cc-config)
;;; crafted-custom-cc-config.el ends here
