;;; crafted-custom-completion-config.el --- Crafted Completion Configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; Setup completion packages.  Completion in this sense is more like
;; narrowing, allowing the user to find matches based on minimal
;; inputs and "complete" the commands, variables, etc from the
;; narrowed list of possible choices.

;;; Code:
;; Completions
                                        ; Completions based on vertico, not on builtin icomplete-mode
(customize-set-variable 'completion-cycle-threshold 3)
(customize-set-variable 'tab-always-indent 'complete)
(customize-set-variable 'completion-category-overrides
                        '((file (styles . (partial-completion)))))
(customize-set-variable 'completions-detailed t)

;;; Vertico
;; Start Vertico
(vertico-mode 1)
;; Cycle back to top/bottom result when the edge is reached
(setq vertico-cycle t)

;; configure keys for those who prefer vi keybindings
(keymap-set vertico-map "C-j" 'vertico-next)
(keymap-set vertico-map "C-k" 'vertico-previous)
(keymap-set vertico-map "M-h" 'vertico-directory-up)


;;; Marginalia

;; Configure Marginalia
(setq marginalia-annotators
      '(marginalia-annotators-heavy
        marginalia-annotators-light
        nil))
(marginalia-mode 1)

;;; Consult
;; Set some consult bindings
(keymap-global-set "C-s" 'consult-line)
(keymap-set minibuffer-local-map "C-r" 'consult-history)

(setq completion-in-region-function #'consult-completion-in-region)

;;; Orderless
;; Set up Orderless for better fuzzy matching
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

;;; Embark
(keymap-global-set "<remap> <describe-bindings>" #'embark-bindings)
(keymap-global-set "C-." 'embark-act)

;; Hide the mode line of the Embark live/completions buffers
(add-to-list 'display-buffer-alist
             '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
               nil
               (window-parameters (mode-line-format . none))))

;; Use Embark to show bindings in a key prefix with `C-h`
(setq prefix-help-command #'embark-prefix-help-command)

;; (when (featurep 'embark-consult)
;;   (with-eval-after-load 'embark-consult
;;     (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode)))

;; ;;; Corfu
(unless (display-graphic-p)
  (corfu-terminal-mode +1))

;; Setup corfu for popup like completion
(setq corfu-cycle t)                 ; Allows cycling through candidates
(setq corfu-auto t)                  ; Enable auto completion
(setq corfu-auto-prefix 2)           ; Complete with less prefix keys
(setq corfu-auto-delay 0.0)          ; No delay for completion
(setq corfu-echo-documentation 0.25) ; Echo docs for current completion option

(global-corfu-mode 1)

(corfu-popupinfo-mode 1)
(eldoc-add-command #'corfu-insert)

;;; Cape
;; Setup Cape for better completion-at-point support and more

;; Add useful defaults completion sources from cape
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)

;; Silence the pcomplete capf, no errors or messages!
;; Important for corfu
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)

;; Ensure that pcomplete does not write to the buffer
;; and behaves as a pure `completion-at-point-function'.
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)
(add-hook 'eshell-mode-hook
          (lambda () (setq-local corfu-quit-at-boundary t
                                 corfu-quit-no-match t
                                 corfu-auto nil)
            (corfu-mode)))

(provide 'crafted-custom-completion-config)
;;; crafted-custom-completion-config.el ends here