;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/40_git.el
;;; Description: Setup for Git
;;;
;;; Code:
;;;

;; install external packages
(el-get 'sync '(gist git-gutter-fringe+ magit))

;;;=============================================================================
;;; Git customization
;;;=============================================================================
(el-get-bundle magit)
(use-package magit
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  )

(el-get-bundle git-gutter-fringe+)
(use-package git-gutter-fringe+
  :config
  (global-git-gutter+-mode))

(el-get-bundle gist)
(use-package gist)
