;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/05_themes.el
;;; Description: Customize Emacs themes
;;;

(el-get 'sync
        '(color-theme-solarized
          birds-of-paradise-plus-theme
          darkmine-theme
          dream-theme
          color-theme-zenburn))

(load-theme 'dream t)

;; (when (require 'atom-dark-theme nil t)
;;   (load-theme 'atom-dark)
;;   )

;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)

;; ;; Change light/dark themes interactively
;; (defun light-theme ()
;;   (interactive)
;;   (load-theme 'solarized-light t))

;; (defun dark-theme ()
;;   (interactive)
;;   (load-theme 'solarized-dark t))
