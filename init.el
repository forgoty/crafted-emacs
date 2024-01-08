;;; init.el -*- lexical-binding: t; -*-

;;; Initial phase.

;; Load the custom file if it exists.  Among other settings, this will
;; have the list `package-selected-packages', so we need to load that
;; before adding more packages.  The value of the `custom-file'
;; variable must be set appropriately, by default the value is nil.
;; This can be done here, or in the early-init.el file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil 'nomessage))
;; Adds crafted-emacs modules to the `load-path', sets up a module
;; writing template, sets the `crafted-emacs-home' variable.
(load "~/.emacs.d/modules/crafted-init-config")

;;; Packages phase

;; Collect list of packages to install.  Do not just blindly copy this
;; list, instead think about what you need and see if there is a
;; module which provides the list of packages needed.  This phase is
;; not needed if manage the installed packages with Guix or Nix.  It
;; is also not needed if you do not need Crafted Emacs to install
;; packages for a module, for example,
;; `crafted-mastering-emacs-config' does not require any packages to
;; be installed.
(require 'crafted-completion-packages)	; add completion packages to
					; the
					; `package-selected-packages'
					; list
(require 'crafted-evil-packages)
(require 'crafted-org-packages)
(require 'crafted-ui-packages)
(require 'crafted-ide-packages)
(require 'crafted-writing-packages)
(require 'crafted-custom-themes-packages)
(require 'crafted-custom-input-packages)
(require 'crafted-custom-tools-packages)

;; IDE features
(require 'crafted-golang-packages)
(require 'crafted-custom-cc-packages)
(require 'crafted-custom-js-ts-packages)
(require 'crafted-custom-copilot-packages)

;; Install the packages listed in the `package-selected-packages' list.
(package-install-selected-packages :noconfirm)

;;; Configuration phase

;; Some example modules to configure Emacs. Don't blindly copy these,
;; they are here for example purposes.  Find the modules which work
;; for you and add them here.
(require 'crafted-defaults-config)
(require 'crafted-startup-config)
(require 'crafted-evil-config)
(require 'crafted-org-config)
(require 'crafted-ui-config)
(require 'crafted-ide-config)
(require 'crafted-workspaces-config)
(require 'crafted-completion-config)
(require 'crafted-writing-config)
(require 'crafted-custom-completion-config)
(require 'crafted-custom-themes-config)
(require 'crafted-custom-tools-config)
(require 'crafted-custom-input-config)

;; IDE features
(require 'crafted-golang-config)
(require 'crafted-custom-cc-config)
(require 'crafted-custom-copilot-config)

(unless crafted-startup-inhibit-splash
  (setq initial-buffer-choice #'crafted-startup-screen))

;;; Optional configuration

;;; Emacs lisp source/compiled preference
;; Prefer loading newest compiled .el file
(customize-set-variable 'load-prefer-newer t)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Crafted Emacs loaded in %s."
                     (emacs-init-time))))

;; Set default coding system (especially for Windows)
(set-default-coding-systems 'utf-8)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
