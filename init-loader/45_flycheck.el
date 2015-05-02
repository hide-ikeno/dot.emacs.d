;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 45_flycheck.el
;;; Description: Customize flycheck
;;;
;;; Code:
(el-get-bundle hydra)
(el-get-bundle s)
(el-get-bundle flycheck)
(el-get-bundle flycheck-tip)

;;;=============================================================================
;;; flycheck --- Modern on the fly syntax checking for GNU Emacs
;;;=============================================================================
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )

;;;=============================================================================
;;; flycheck-tip
;;;=============================================================================
(use-package flycheck-tip)
