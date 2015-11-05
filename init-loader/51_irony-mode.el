;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 51_irony-mode.el
;;; Description: Customize 
;;;
;;; Code:

;;;=============================================================================
;;; DoxyMacs
;;;=============================================================================

;;;=============================================================================
;;; Irony-Mode --- A C/C++ minor mode powered by libclang
;;;=============================================================================
(el-get-bundle irony-mode)
(use-package irony
  :defines irony-mode-map
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
;;; flycheck-irony --- Flycheck checker for irony-mode
;;;=============================================================================
(el-get-bundle flycheck-irony)
(use-package flycheck-irony
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )

;;;=============================================================================
;;; irony-eldoc --- irony-mode support for eldoc-mode
;;;=============================================================================
(el-get-bundle irony-eldoc)
(use-package irony-eldoc
  :config
  (add-hook 'irony-mode-hook 'irony-eldoc)
  )

;;;=============================================================================
;;; ac-irony --- auto-complete for irony-mode
;;;=============================================================================
(el-get-bundle ac-irony)
(use-package ac-irony
  :config
  (defun my-ac-irony-setup ()
    (yas-minor-mode 1)
    (auto-complete-mode 1)
    (add-to-list 'ac-sources 'ac-source-irony)
    (bind-key "M-RET" 'ac-complete-irony-async irony-mode-map))
  (add-hook 'irony-mode-hook 'my-ac-irony-setup)
  )
