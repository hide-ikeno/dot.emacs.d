;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/05_init.el
;;; Description: Look & Feel
;;;

;;;=============================================================================
;;; Modeline & frame customization
;;;=============================================================================

;;; Inhibit startup message
(setq inhibit-startup-screen t)

;;; Inhibit toolbar
(tool-bar-mode 0)

;;; Inhibit scroll-bar
(scroll-bar-mode 0)

;;; Inhibit menu bar
(menu-bar-mode 0)

;;; Display file size on modeline
(size-indication-mode t)
;;; Display clock on modeline
(setq display-time-day-and-date t)
(display-time)

;;; Show line numbers and column numbers
(line-number-mode t)                    ; show line number on modeline
(column-number-mode t)                  ; show column number on modeline

;;;=============================================================================
;;; uniquify -- 同名バッファを分かり易く
;;;=============================================================================
(use-package uniquify)

;;;=============================================================================
;;; anzu -- Show number of matches in mode-line while searching
;;;=============================================================================
(el-get-bundle anzu)
(use-package anzu
  :functions global-anzu-mode
  :config
  (global-anzu-mode t)
  )

;;;=============================================================================
;;; linum-mode -- show line numbers on left margin
;;;=============================================================================
(use-package linum
  :config
  (global-linum-mode t)
  )
