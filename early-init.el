;;; early-init.el --- Emacs early initialization for Crafted Emacs (optional) -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;; Configures `package.el'
(load "~/.config/crafted-emacs/modules/crafted-early-init-config")

;; Defer garbage collection further back in the startup process
(let ((old-threshold gc-cons-threshold))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (setq gc-cons-threshold old-threshold)))
  (setq gc-cons-threshold most-positive-fixnum))

;; Silence compiler warnings as they can be pretty disruptive
(setq comp-async-report-warnings-errors nil)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(setq inhibit-startup-screen t )
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;; Cursor
(blink-cursor-mode 0)

;; Prevent unwanted runtime builds in gccemacs (native-comp); packages are
;; compiled ahead-of-time when they are installed and site files are compiled
;; when gccemacs is installed.
(setq comp-deferred-compilation nil)

;;; Line Numbers
(setq display-line-numbers-type 'relative)
(column-number-mode 1)
(global-display-line-numbers-mode 1)

;; sentence SHOULD end with only a point.
(setq sentence-end-double-space nil)
;; toggle wrapping text at the 80th character
(setq default-fill-column 80)

;; Set up the visible bell
(setq visible-bell t)
;; silent bell when you make a mistake
(setq ring-bell-function 'ignore )

;; Delete excess backup versions
(setq delete-old-versions -1 )

;; Don't warn for large files (shows up when launching videos)
(setq large-file-warning-threshold nil)

;; Use version control
(setq version-control t )
;;Don't warn for following symlinked files
(setq vc-follow-symlinks t)
;; make backups file even when in version controlled dir
(setq vc-make-backup-files t )
;; which directory to put backups file
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) )
;;transform backups file name
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) )

;;Don't warn when advice is added for functions
(setq ad-redefinition-action 'accept)

;; Set font
(set-face-attribute 'default nil :font "Hack" :height 120)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; Tab Widths
;; Default to an indentation size of 2 spaces since it's the norm for pretty much every language I use.
(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

;; Use spaces instead of tabs for indentation
(setq-default indent-tabs-mode nil)

(provide 'early-init)

;;; early-init.el ends here
