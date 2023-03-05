;; Kill all other buffers.
(defun custom/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; Saves all buffers silently
(defun save-all ()
  "Saves all buffers silently."
  (interactive)
  (save-some-buffers t))

(defun eglot--spinner (args)
  "asdf"
  (eglot--progress-reporters args))

(defun custom/eglot-organize-imports ()
  (interactive)
  (eglot-code-actions nil nil "source.organizeImports" t))

(setq project-vc-extra-root-markers
   '("package.json" "go.mod" "requirements.txt"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-category-overrides '((file (styles partial-completion))))
 '(completion-cycle-threshold 3)
 '(completion-styles '(orderless basic))
 '(completions-detailed t)
 '(corfu-auto t)
 '(corfu-auto-delay 0.0)
 '(corfu-auto-prefix 2)
 '(corfu-cycle t)
 '(corfu-echo-documentation 0.25 t)
 '(crafted-updates-fetch-interval "128 hours")
 '(eglot-autoshutdown t t)
 '(evil-respect-visual-line-mode t)
 '(evil-undo-system 'undo-redo)
 '(evil-want-C-h-delete t)
 '(evil-want-C-i-jump nil)
 '(evil-want-integration t)
 '(evil-want-keybinding nil)
 '(fast-but-imprecise-scrolling t)
 '(global-auto-revert-non-file-buffers t)
 '(ibuffer-movement-cycle nil)
 '(ibuffer-old-time 24)
 '(kill-do-not-save-duplicates t)
 '(load-prefer-newer t t)
 '(marginalia-annotators
   '(marginalia-annotators-heavy marginalia-annotators-light nil) t)
 '(org-hide-emphasis-markers t t)
 '(org-link-descriptive t t)
 '(org-mouse-1-follows-link t t)
 '(org-return-follows-link t t)
 '(package-archive-priorities
   '(("gnu" . 99)
     ("nongnu" . 80)
     ("stable" . 70)
     ("melpa" . 0)))
 '(package-selected-packages
   '(tabspaces flycheck-golangci-lint go-mode popwin flycheck-pos-tip flycheck evil-visualstar evil-surround ibuffer-project aggressive-indent editorconfig tree-sitter-langs tree-sitter-ispell tree-sitter-indent tree-sitter evil-iedit-state iedit restart-emacs rg winum which-key general evil-embrace evil-nerd-commentary doom-modeline doom-themes helpful elisp-demos all-the-icons org-appear eglot evil-nerd-commenter evil-collection evil vertico orderless marginalia embark-consult embark corfu-terminal corfu consult cape))
 '(scroll-conservatively 101)
 '(scroll-margin 0)
 '(scroll-preserve-screen-position t)
 '(switch-to-buffer-in-dedicated-window 'pop)
 '(switch-to-buffer-obey-display-actions t)
 '(tab-always-indent 'complete)
 '(tabspaces-include-buffers '("*scratch*"))
 '(tabspaces-remove-to-default t)
 '(tabspaces-use-filtered-buffers-as-default t)
 '(vertico-cycle t)
 '(xref-show-definitions-function 'xref-show-definitions-completing-read t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "#fabd2f"))))
 '(font-lock-type-face ((t (:foreground "#d3869b"))))
 '(tree-sitter-hl-face:function ((t (:inherit font-lock-function-name-face :slant normal))))
 '(tree-sitter-hl-face:function\.call ((t (:inherit font-lock-function-name-face :underline nil))))
 '(tree-sitter-hl-face:method\.call ((t (:inherit tree-sitter-hl-face:function\.call :slant normal))))
 '(tree-sitter-hl-face:property ((t (:inherit font-lock-constant-face :foreground "#8ec07c" :slant italic)))))
