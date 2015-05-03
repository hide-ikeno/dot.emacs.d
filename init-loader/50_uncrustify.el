;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 50_uncrustify.el
;;; Description: Customize uncrustify
;;;
;;; Code:

;;;=============================================================================
;;; Emacs frontend of the Uncrustify code beautifier
;;;=============================================================================
(el-get-bundle koko1000ban/emacs-uncrustify-mode :name uncrustify-mode)
(use-package uncrustify-mode
  :commands uncrustify-mode
  :defines uncrustify-config-path
  :config
  ;; Location of the uncrustify configuration file
  (setq-default uncrustify-config-path "~/.uncrustify/uncrustify.cfg")
  ;; Run uncrustify when buffer is saved
  (add-hook 'c-mode-common-hook
            '(lambda () (uncrustify-mode 1)))
  )

