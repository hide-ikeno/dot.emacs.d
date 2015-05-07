;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 50_projectile.el
;;; Description: Setup projectile
;;;
;;; Code:
;;;

;;;==============================================================================
;;; Projectile --- Project Interaction Library for Emacs
;;;==============================================================================
(el-get-bundle projectile)

(use-package projectile
  :commands
  projectile-global-mode
  helm-projectile-on
  :defines
  projectile-indexing-method
  projectile-enable-caching
  :init
  (projectile-global-mode)
  :config
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (use-package helm-projectile
    :commands helm-projectile-on
    :config
    (setq helm-projectile-fuzzy-match t)
    (helm-projectile-on)
    )
  )
