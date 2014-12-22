;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_flycheck.el
;;; Description: Customize flycheck
;;;
;;; Code:

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; C/C++
  (setq flycheck-clang-language-standard "c++11")
  (setq flycheck-clang-standard-library "libc++")
  )

(use-package flycheck-pos-tip)
