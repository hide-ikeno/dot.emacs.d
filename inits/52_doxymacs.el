;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/51_doxymacs.el
;;; Description: Major mode for other langulage
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Doxymacs -- Doxygen + Emacs
;;;  <http://doxymacs.sourceforge.net/>
;;;=============================================================================
(use-package doxymacs
  :config
  (defun my-doxymacs-font-lock-hook ()
    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
        (doxymacs-font-lock)))
  (setq doxymacs-doxygen-style "Qt") ;; Qt or JavaDoc or C++ or C++!
  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
  (add-hook 'c-mode-common-hook 'doxymacs-mode)
  )

