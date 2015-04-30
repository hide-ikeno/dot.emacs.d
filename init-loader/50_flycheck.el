;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_flycheck.el
;;; Description: Customize flycheck
;;;
;;; Code:

(el-get 'sync '(popup flycheck flycheck-pos-tip))

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )
