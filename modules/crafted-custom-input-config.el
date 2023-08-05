;;;; crafted-custom-input-config.el --- configure input for emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;;

;;; Code:

;; SPC map
(defvar my-leader-key "SPC" "The leader prefix key for Evil users.")

;; Which key
(which-key-mode t)
(setq which-key-idle-delay 0.2)

;; Evil
(defun custom/evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun custom/evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

; Overload shifts so that they don't lose the selection
(evil-define-key 'visual global-map "<" 'custom/evil-shift-left-visual)
(evil-define-key 'visual global-map ">" 'custom/evil-shift-right-visual)

; gc to comment lines in visual mode
(define-key evil-visual-state-map "gc" 'evilnc-comment-operator)

; go to definition other window
(evil-define-key 'normal global-map "gD" 'xref-find-definitions-other-window)
; find implementation
(evil-define-key 'normal global-map "gi" 'eglot-find-implementation)

;; Evil-surround
(global-evil-surround-mode 1)
;; Spacemacs-like keybindings:
;; https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#the-vim-surround-case
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)

;; Evil-visualstar
(global-evil-visualstar-mode)

;; general package config
(general-evil-setup t)
(general-create-definer my-leader-def
  :keymaps '(normal visual emacs)
  :prefix my-leader-key)

;; Iedit
(setq iedit-current-symbol-default t
      iedit-only-at-symbol-boundaries t
      iedit-toggle-key-default nil)

(my-leader-def
  "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to previous window")
  "SPC" '(execute-extended-command :which-key "M-x")
  "/" '(custom/rg-custom-search :which-key "regexp search in project")
  "1" '(winum-select-window-1 :which-key "select window 1")
  "2" '(winum-select-window-2 :which-key "select window 2")
  "3" '(winum-select-window-3 :which-key "select window 3")
  "4" '(winum-select-window-4 :which-key "select window 4")
  "5" '(winum-select-window-5 :which-key "select window 5")
  "6" '(winum-select-window-6 :which-key "select window 6")
  "7" '(winum-select-window-7 :which-key "select window 7")
  "8" '(winum-select-window-8 :which-key "select window 8")
  "9" '(winum-select-window-9 :which-key "select window 9"))

;; same as previous but this keybindings shouldn't be overriden by any modes
;; for example as dired-mode
(general-define-key
 :states 'normal
 :keymaps 'override
 :prefix my-leader-key
  "SPC" '(execute-extended-command :which-key "M-x")
  "1" '(winum-select-window-1 :which-key "select window 1")
  "2" '(winum-select-window-2 :which-key "select window 2")
  "3" '(winum-select-window-3 :which-key "select window 3")
  "4" '(winum-select-window-4 :which-key "select window 4")
  "5" '(winum-select-window-5 :which-key "select window 5")
  "6" '(winum-select-window-6 :which-key "select window 6")
  "7" '(winum-select-window-7 :which-key "select window 7")
  "8" '(winum-select-window-8 :which-key "select window 8")
  "9" '(winum-select-window-9 :which-key "select window 9"))

(my-leader-def
  "q"  '(:ignore t :which-key "quit/restart")
  "qq" '(evil-quit :which-key "quit")
  "qr" '(restart-emacs :which-key "restart"))
(my-leader-def
  "t"  '(:ignore t :which-key "toggles")
  "tt" '(load-theme t :which-key "choose theme"))
(my-leader-def
  "f"  '(:ignore t :which-key "files")
  "ft" '(dired-other-window :which-key "dired")
  "ff" '(find-file :which-key "find-file")
  "fs" '(save-buffer :which-key "save file")
  "fS" '(save-all :which-key "save all"))
(my-leader-def
  "p"  '(:keymap project-prefix-map :package project))
(my-leader-def
  "w"  '(evil-window-map t :which-key "windows")
  "wd" '(evil-window-delete t :which-key "window delete"))
(my-leader-def
  "s"  '(:ignore t :which-key "search/symbol")
  "ss" '(rg-project :which-key "project search")
  "sc" '(evil-ex-nohighlight :which-key "clear highlight")
  "se" '(iedit-mode :which-key "iedit")
  "sw" '(rg-dwim-project-dir :which-key "search a word in a project")
  )
(my-leader-def
  "b"  '(:ignore t :which-key "buffers")
  "bs" '(save-buffer :which-key "save file")
  "bD" '(custom/kill-other-buffers :which-key "kill other buffers")
  "bb" '(consult-buffer :which-key "list buffers")
  "bn" '(evil-next-buffer :which-key "next buffer")
  "bp" '(evil-prev-buffer :which-key "previous buffer")
  "bd" '(kill-current-buffer t :which-key "delete buffer"))
(my-leader-def
  "g"  '(:ignore t :which-key "git")
  "gb" '(magit-blame-addition :which-key "blame"))
(my-leader-def
  "e"  '(:ignore t :which-key "errors")
  "eb" '(flycheck-buffer :which-key "check errors")
  "ec" '(flycheck-clear :which-key "clear errors")
  "ed" '(flycheck-disable-checker :which-key "disable checker")
  "eh" '(flycheck-describe-checker :which-key "view checkers")
  "el" '(custom/toggle-flycheck-error-list :which-key "list")
  "eL" '(custom/goto-flycheck-error-list :which-key "go-to error list")
  "es" '(flycheck-select-checker :which-key "select checker")
  "eS" '(flycheck-set-checker-executable :which-key "check executable")
  "ev" '(flycheck-verify-setup :which-key "verify checker")
  "ey" '(flycheck-copy-errors-as-kill :which-key "copy errors")
  "en" '(flycheck-next-error :which-key "next error")
  "ep" '(flycheck-previous-error :which-key "prev errors")
  "ex" '(flycheck-explain-error-at-point t :which-key "explain error"))

(provide 'crafted-custom-input-config)
;;; crafted-custom-input-config.el ends here
