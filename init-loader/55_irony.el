;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/55_irony.el
;;; Description: Customize irony-mode
;;;
;;; Code:

(el-get 'sync '(irony-mode company-irony flycheck-irony))

;;;=============================================================================
;;; Irony-Mode --- A C/C++ minor mode powered by libclang
;;;=============================================================================

(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
	(define-key irony-mode-map [remap completion-at-point]
	  'irony-completion-at-point-async)
	(define-key irony-mode-map [remap complete-symbol]
	  'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )


;;;=============================================================================
;;; company-irony --- Completion backend for irony-mode
;;;=============================================================================
(use-package company-irony
  :config
  (add-to-list 'company-backends 'company-irony)
  ;; (optional) adds CC special commands to `company-begin-commands' in order to
  ;; trigger completion at interesting places, such as after scope operator
  ;;     std::|
  (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
  )

;;;=============================================================================
;;; flycheck-irony --- Flycheck checker for irony-mode
;;;=============================================================================
(use-package flycheck-irony
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )
