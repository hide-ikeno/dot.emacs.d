;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_lang.el
;;; Description: Customize major mode for programing languages
;;;
;;; Code:

(el-get 'sync '(doxymacs doxy-preview))

;;;=============================================================================
;;; DoxyMacs
;;;=============================================================================
(use-package doxymacs
  :config
  (add-hook 'c-mode-common-hook'doxymacs-mode)
  ;;(setq doxymacs-doxygen-style "C++") ;; Qt or JavaDoc or C++
  (setq doxymacs-doxygen-style "Qt") ;; Qt or JavaDoc or C++
  (defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
  )

;;;=============================================================================
;;; doxy-preview
;;;=============================================================================

;; (use-package doxy-preview)
