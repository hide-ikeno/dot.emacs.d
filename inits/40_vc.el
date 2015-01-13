;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/40_vc.el
;;; Description: Customize VC (version control)
;;;
;;; Code:
;;;

;;;=============================================================================
;;; VC -- Emacs version control
;;;=============================================================================
(use-package vc
  :config
  (setq make-backup-files t)
  (setq backup-directory-alist
        ;; Make Backup files into ~/bak
        (cons (cons "\\.*$" (expand-file-name "~/bak"))
              backup-directory-alist))
  (setq version-control t)
  (setq kept-new-versions 2)
  (setq kept-old-versions 2)
  (setq delete-old-versions t)
  )
