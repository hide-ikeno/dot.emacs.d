;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 45_flycheck.el
;;; Description: Customize flycheck
;;;
;;; Code:
(el-get-bundle hydra)
(el-get-bundle s)
(el-get-bundle flycheck)
(el-get-bundle flycheck-pos-tip)

;;;=============================================================================
;;; flycheck --- Modern on the fly syntax checking for GNU Emacs
;;;=============================================================================
(use-package flycheck
  :commands global-flycheck-mode
  :init (global-flycheck-mode)
  )

;;;=============================================================================
;;; flycheck-tip
;;;=============================================================================
(use-package flycheck-pos-tip)
