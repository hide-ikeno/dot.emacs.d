;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_flycheck.el
;;; Description: Customize flycheck
;;;
;;; Code:

(el-get 'sync '(flycheck flycheck-pos-tip))

(when (require 'flycheck nil t)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )
