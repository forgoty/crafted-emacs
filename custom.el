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
  "Needed for backport prior emacs 29"
  (eglot--progress-reporters args))

(setq project-vc-extra-root-markers
      '("package.json" "requirements.txt" ".git"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method 'aggressive t)
 '(bookmark-save-flag 1)
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
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" default))
 '(dired-auto-revert-buffer t)
 '(dired-dwim-target t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain t)
 '(eglot-autoshutdown t)
 '(eshell-scroll-to-bottom-on-input 'this t)
 '(evil-respect-visual-line-mode t)
 '(evil-undo-system 'undo-redo)
 '(evil-want-C-h-delete t)
 '(evil-want-C-i-jump nil)
 '(evil-want-integration t)
 '(evil-want-keybinding nil)
 '(fancy-splash-image "/home/nikita/.emacs.d/system-crafters-logo.png")
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
   '(evil-textobj-tree-sitter flycheck-eglot flycheck-google-cpplint protobuf-ts-mode aggressive-indent plantuml-mode eglot flycheck-golangci-lint magit restart-emacs popwin flycheck-pos-tip flycheck rg winum which-key general evil-iedit-state evil-visualstar evil-surround evil-embrace evil-nerd-commentary doom-modeline doom-themes ibuffer-project editorconfig helpful elisp-demos all-the-icons org-roam org-appear denote evil-anzu evil-nerd-commenter evil-collection evil vertico-directory vertico orderless marginalia embark-consult embark corfu-terminal corfu consult cape))
 '(scroll-conservatively 101)
 '(scroll-margin 0)
 '(scroll-preserve-screen-position t)
 '(switch-to-buffer-in-dedicated-window 'pop)
 '(switch-to-buffer-obey-display-actions t)
 '(tab-always-indent 'complete)
 '(tabspaces-include-buffers '("*scratch*"))
 '(tabspaces-mode t)
 '(tabspaces-remove-to-default t)
 '(tabspaces-use-filtered-buffers-as-default t)
 '(vertico-cycle t)
 '(xref-show-definitions-function 'xref-show-definitions-completing-read))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "#fabd2f"))))
 '(font-lock-type-face ((t (:foreground "#d3869b")))))
