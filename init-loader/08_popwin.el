;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/08_popwin.el
;;; Description: Setup direx mode
;;;
(el-get-bundle popwin)
(use-package popwin
  :commands popwin-mode
  :config (popwin-mode 1)
  )
