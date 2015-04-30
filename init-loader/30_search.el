;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_lang.el
;;; Description: Customize major mode for programing languages
;;;
;;; Code:

;;;============================================================================
;;; visual-regexp
;;;   A regexp/replace command for Emacs with interactive visual feedback
;;;   <https://github.com/benma/visual-regexp.el>
;;;============================================================================
(el-get-bundle visual-regexp)
(use-package visual-regexp
  :bind ("M-%" . vr/query-replace))

;;;=============================================================================
;;; wgrep --- Writable grep buffer and apply the changes to files
;;;=============================================================================
(el-get-bundle wgrep)
(use-package wgrep)
