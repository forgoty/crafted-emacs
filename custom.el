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
 '(crafted-updates-fetch-interval "96 hours")
 '(package-selected-packages
   '(rg winum which-key general evil-embrace evil-nerd-commentary doom-modeline doom-themes helpful elisp-demos all-the-icons org-appear eglot evil-nerd-commenter evil-collection evil vertico orderless marginalia embark-consult embark corfu-terminal corfu consult cape)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
