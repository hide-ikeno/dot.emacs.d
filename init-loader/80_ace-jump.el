;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_lang.el
;;; Description: Customize major mode for programing languages
;;;
;;; Code:

;;;=============================================================================
;;; ace-jump-mode -- a quick cursor jump mode for emacs
;;;=============================================================================
(el-get-bundle ace-jump-mode)
(use-package ace-jump-mode)

;;;=============================================================================
;;; ace-window
;;;=============================================================================
(el-get-bundle ace-window)
(use-package ace-window
  ;; :defines aw-keys
  :bind ("C-x o" . ace-window)
  ;; :config
  ;; (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

;;;=============================================================================
;;; ace-isearch -- A seamless bridge between isearch and ace-jump-mode
;;;=============================================================================
(el-get-bundle ace-isearch)
(use-package ace-isearch
  :defines ace-isearch-input-idle-delay
  :commands global-ace-isearch-mode
  :init    (global-ace-isearch-mode t)
  :config (setq ace-isearch-input-idle-delay 0.5)
  )

;;;=============================================================================
;;; switch-window -- Window switching, the visual way.
;;;=============================================================================
;; (use-package switch-window
;;   :bind ("C-x o" . switch-window))
