;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/08_popwin.el
;;; Description: Setup direx mode
;;;

;;;=============================================================================
;;; popwin --- popup window manager
;;;=============================================================================
(el-get-bundle popwin)
(use-package popwin
  :commands popwin-mode
  :config (popwin-mode 1)
  )

;;;=============================================================================
;;; switch-window
;;;=============================================================================
(el-get-bundle switch-window)
(use-package switch-window
  :bind ("C-x o" . switch-window)
  )

