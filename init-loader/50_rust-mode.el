;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 50_rust.el
;;; Description: Major mode for Rust programing language
;;;
;;; Code:
;;;

(el-get 'sync '(rust-mode))

;;;=============================================================================
;;; Rust mode
;;;=============================================================================
(el-get-bundle rust-mode)
(use-package rust-mode
  :mode (("\\.rs\\'" . rust-mode))
  )
