;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 50_uncrustify.el
;;; Description: Customize uncrustify
;;;
;;; Code:

;;;=============================================================================
;;; Emacs frontend of the Uncrustify code beautifier
;;;=============================================================================
(el-get-bundle glima/Emacs-uncrustify :name uncrustify)
(use-package uncrustify
  :config
  ;; Location of the uncrustify configuration file
  (setq uncrustify-uncrustify-cfg-file "~/.uncrustify/uncrustify.cfg")
  ;; Run uncrustify when buffer is saved
  (setq uncrustify-uncrustify-on-save t)
  )

