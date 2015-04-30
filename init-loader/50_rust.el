;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_rust.el
;;; Description: Major mode for Rust programing language
;;;
;;; Code:
;;;

(el-get 'sync '(rust-mode))

;;;=============================================================================
;;; Rust mode
;;;=============================================================================

(use-package rust-mode
  :mode (("\\.rs\\'" . rust-mode))
  )
