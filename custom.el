;; Kill all other buffers.
(defun custom/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; Saves all buffers silently
(defun save-all ()
  "Saves all buffers silently."
  (interactive) (save-some-buffers t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-category-overrides '((file (styles partial-completion))))
 '(completion-cycle-threshold 3)
 '(completions-detailed t)
 '(crafted-updates-fetch-interval "96 hours")
 '(eglot-autoshutdown t t)
 '(evil-respect-visual-line-mode t)
 '(evil-undo-system 'undo-redo)
 '(evil-want-C-h-delete t)
 '(evil-want-C-i-jump nil)
 '(evil-want-integration t)
 '(evil-want-keybinding nil)
 '(fast-but-imprecise-scrolling t)
 '(global-auto-revert-non-file-buffers t)
 '(ibuffer-movement-cycle nil t)
 '(ibuffer-old-time 24 t)
 '(kill-do-not-save-duplicates t)
 '(load-prefer-newer t t)
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
   '(rg winum which-key general evil-embrace evil-nerd-commentary doom-modeline doom-themes helpful elisp-demos all-the-icons org-appear eglot evil-nerd-commenter evil-collection evil vertico orderless marginalia embark-consult embark corfu-terminal corfu consult cape))
 '(scroll-conservatively 101)
 '(scroll-margin 0)
 '(scroll-preserve-screen-position t)
 '(switch-to-buffer-in-dedicated-window 'pop)
 '(switch-to-buffer-obey-display-actions t)
 '(tab-always-indent 'complete)
 '(xref-show-definitions-function 'xref-show-definitions-completing-read t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
