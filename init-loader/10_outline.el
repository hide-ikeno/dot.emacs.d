;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/10_outline.el
;;; Description: Customize outline mode
;;;

;;;=============================================================================
;;; outline-magic.el -- outline mode extensions for Emacs
;;;=============================================================================

;; TAB:     現在のサブツリーの折畳み・展開
;; C-u TAB: 全ツリーの折畳み・展開
;; M-<up>, M-<down>: サブツリーの移動
;; M-<left>, M-<right>: サブツリーの階層変更
(el-get-bundle outline-magic)
(use-package outline-magic)
