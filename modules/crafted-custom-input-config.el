;;;; crafted-custom-input-config.el --- configure input for emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2023
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;;

;;; Code:
;; gc to comment lines in visual mode
(define-key evil-visual-state-map "gc" 'evilnc-comment-operator)

;; SPC map
(defvar my-leader-key "SPC" "The leader prefix key for Evil users.")

(which-key-mode t)
(setq which-key-idle-delay 0.2)


(general-evil-setup t)
(general-create-definer my-leader-def
  :keymaps '(normal visual emacs)
  :prefix my-leader-key)

(my-leader-def
  "TAB" '(evil-switch-to-windows-last-buffer :which-key "switch to previous window")
  "/" '(rg-custom-search :which-key "regexp search in project")
  "1" '(winum-select-window-1 :which-key "select window 1")
  "2" '(winum-select-window-2 :which-key "select window 2")
  "3" '(winum-select-window-2 :which-key "select window 3")
  "4" '(winum-select-window-2 :which-key "select window 4")
  "5" '(winum-select-window-2 :which-key "select window 5")
  "6" '(winum-select-window-2 :which-key "select window 6")
  "7" '(winum-select-window-2 :which-key "select window 7")
  "8" '(winum-select-window-2 :which-key "select window 8")
  "9" '(winum-select-window-2 :which-key "select window 9"))
(my-leader-def
  "q"  '(:ignore t :which-key "quit")
  "qq" '(evil-quit :which-key "quit"))
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
  "sw" '(rg-dwim-project-dir :which-key "search a word in a project")
  )
(my-leader-def
  "b"  '(:ignore t :which-key "buffers")
  "bs" '(save-buffer :which-key "save file")
  "bD" '(custom/kill-other-buffers :which-key "kill other buffers")
  "bb" '(list-buffers :which-key "list buffers")
  "bd" '(kill-current-buffer t :which-key "delete buffer"))


(provide 'crafted-custom-input-config)
;;; crafted-custom-input-config.el ends here
