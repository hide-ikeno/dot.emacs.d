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
;; "C-/", "C-_": undo
;; "C-?", "M-_": redo
;; "C-x u": undo-tree-visualize
(use-package undo-tree
  :config
  ;; Replace the standard Emacs undo behavie
  (global-undo-tree-mode)
  )
