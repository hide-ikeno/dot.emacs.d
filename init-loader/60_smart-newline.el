;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 60_smart-newline.el
;;; Description: 
;;;

(el-get-bundle smart-newline)
(use-package smart-newline
  :init
  (add-hook 'ruby-mode-hook ;; or any major-mode-hooks
            (lambda ()
              (smart-newline-mode t)))
  (add-hook 'python-mode-hook ;; or any major-mode-hooks
            (lambda ()
              (smart-newline-mode t)))
  (add-hook 'c-mode-common-hook ;; or any major-mode-hooks
            (lambda ()
              (smart-newline-mode t)))
  )

