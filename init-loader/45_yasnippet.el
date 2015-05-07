;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 45_yasnippet.el
;;; Description: Setup Yasnippet
;;;

(el-get-bundle yasnippet)
(use-package yasnippet
  :defines yas-snippet-dirs
  :commands yas-global-mode
  :config
  (setq yas-snippet-dirs
        (list (concat user-emacs-directory "local/yasnippet/snippets")
              (concat el-get-dir "/yasnippet/snippets")))
  ;; (custom-set-variables '(yas-trigger-key "TAB"))
  (yas-global-mode 1)
  )
