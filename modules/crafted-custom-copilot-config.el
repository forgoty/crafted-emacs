;;; crafted-custom-copilot-config.el ---             -*- lexical-binding: t; -*-

;; Copyright (C) 2023  

;; Author:  <nikita@arch>
;; Keywords:

;; Code
(require 'copilot)

(defun custom/copilot-tab ()
  "Tab command that will complet with copilot if a completion is
available. Otherwise will try normal
tab-indent."
  (interactive)
  (if (copilot--overlay-visible)
      (copilot-accept-completion))
  (copilot-complete))

(define-key copilot-mode-map (kbd "<backtab>") 'custom/copilot-tab)
(define-key copilot-mode-map (kbd "M-k") #'copilot-next-completion)
(define-key copilot-mode-map (kbd "M-j") #'copilot-previous-completion)

(with-eval-after-load 
  (global-copilot-mode))

(provide 'crafted-custom-copilot-config)
;;; crafted-custom-copilot-config.el ends here
