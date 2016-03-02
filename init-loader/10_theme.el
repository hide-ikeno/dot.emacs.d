;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/05_themes.el
;;; Description: Customize Emacs themes
;;;


;;;=============================================================================
;;; Built-in themes
;;;=============================================================================
;; (load-theme 'misterioso t)
;; (load-theme 'manoj-dark t)
;; (load-theme 'tango-dark t)
;; (load-theme 'tsdh-dark t)
;; (load-theme 'wombat t)

;;;=============================================================================
;;; Third-party themes
;;;=============================================================================
(el-get-bundle material-theme)
(el-get-bundle solarized-emacs)

(use-package material-theme
  :config
  (load-theme 'material t))
