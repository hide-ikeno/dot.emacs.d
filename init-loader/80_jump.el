;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_lang.el
;;; Description: Customize major mode for programing languages
;;;
;;; Code:

(el-get 'sync '(ace-jump-mode ace-isearch switch-window))

;;;=============================================================================
;;; ace-jump-mode -- a quick cursor jump mode for emacs
;;;=============================================================================
(use-package ace-jump-mode)

;;;=============================================================================
;;; ace-isearch -- A seamless bridge between isearch and ace-jump-mode
;;;=============================================================================
(use-package ace-isearch
  :config
  (setq ace-isearch-input-idle-delay 0.5)
  (global-ace-isearch-mode t)
  )

;;;=============================================================================
;;; switch-window -- Window switching, the visual way.
;;;=============================================================================
(use-package switch-window
  :bind ("C-x o" . switch-window))
