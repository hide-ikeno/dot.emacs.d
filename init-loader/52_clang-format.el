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
  :defines
  clang-format-executable
  :commands
  clang-format-region
  :config
  (setq clang-format-executable "/usr/local/bin/clang-format")
  :bind (:map c-mode-base-map
              ("C-M-\\" . clang-format-region))
  )

