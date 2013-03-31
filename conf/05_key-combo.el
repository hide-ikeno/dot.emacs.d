;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/05_key-combo.el
;;; Description: Basic customization
;;;

(el-get 'sync '(key-combo))

;;;=============================================================================
;;; key-combo -- map key sequence to commands
;;;    <https://github.com/uk-ar/key-combo>
;;;=============================================================================
(when (require 'key-combo nil t)
  (key-combo-mode 1)
  (key-combo-load-default)
  )
