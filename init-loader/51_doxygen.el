;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/init-loader/50_doxygen.el
;;; Description: Plugins for Doxygen comments
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Doxymacs --- Doxygen + Emacs
;;;=============================================================================

(el-get-bundle doxymacs)
(use-package doxymacs
  :commands
  doxymacs-font-lock
  :config
  (add-hook 'c-mode-common-hook 'doxymacs-mode)
  (defun my-doxymacs-font-lock-hook ()
    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
        (doxymacs-font-lock)))
  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
  )

;;;=============================================================================
;;; Doxymacs --- Doxygen + Emacs
;;;=============================================================================
(el-get-bundle doxy-preview)
(use-package doxy-preview)
