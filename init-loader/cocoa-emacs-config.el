;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/cocoa-emacs-cofig.el
;;; Description: Setup file for GNU Emacs on Mac OS X
;;;

;; Change modifier keys
;; command -> meta, option -> super
(when (>= emacs-major-version 23)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  )

;; Font

(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 165)
(set-fontset-font nil 'unicode
                  (font-spec :family "Ricty"))

(modify-all-frames-parameters (list (cons 'alpha  '(90 80 50 30))))

;; avoid hiding with M-h
(defvar mac-pass-command-to-system nil)
(defvar mac-pass-control-to-system nil)
(defvar mac-pass-option-to-system nil)
