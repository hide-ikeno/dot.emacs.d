;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/30_undo.el
;;; Description: Costomize behavior of undo
;;;
;;; Code:

(el-get 'sync '(undo-tree))

;;;============================================================================
;;; undo-tree
;;;============================================================================
(use-package undo-tree
  :config
  ;; Replace the standard Emacs undo behavie
  (global-undo-tree-mode)
  )
