;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/40_git.el
;;; Description: Customize Git utilities
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Git customization
;;;=============================================================================

;;;=============================================================================
;;; Magit -- It's Magit! An Emacs mode for Git
;;;          <http://magit.github.io/>
;;;=============================================================================
(use-package magit)

;;;=============================================================================
;;; git-gutter+ or git-gutter-fringe+
;;;   -- View, stage and revert Git changes straight from the buffer.
;;;      <https://github.com/nonsequitur/git-gutter-plus>
;;;=============================================================================
(use-package git-gutter-fringe+
  :config
  (global-git-gutter+-mode)
  )

;;;=============================================================================
;;; Gist
;;;=============================================================================
(use-package gist)
