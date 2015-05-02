;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/05_themes.el
;;; Description: Customize Emacs themes
;;;

(el-get-bundle color-theme-solarized)
(el-get-bundle birds-of-paradise-plus-theme)
(el-get-bundle darkmine-theme)
(el-get-bundle dream-theme)
(el-get-bundle color-theme-zenburn)

(load-theme 'dream t)

;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)

;; ;; Change light/dark themes interactively
;; (defun light-theme ()
;;   (interactive)
;;   (load-theme 'solarized-light t))

;; (defun dark-theme ()
;;   (interactive)
;;   (load-theme 'solarized-dark t))
