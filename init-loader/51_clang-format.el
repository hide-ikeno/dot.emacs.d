;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 51_clang-format.el
;;; Description: Customize uncrustify
;;;
;;; Code:

;;;=============================================================================
;;; Emacs frontend of the Uncrustify code beautifier
;;;=============================================================================
;; (el-get-bundle clang-format)
(use-package clang-format
  :config
  (bind-key "C-M-\\" 'clang-format-region c++-mode-map)
  )

