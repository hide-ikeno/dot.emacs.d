;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/60_yasnippet.el
;;; Description: Setup Yasnippet
;;;

(el-get 'sync '(yasnippet))

(use-package yasnippet
  :config
  (setq yas-snippet-dirs
        ;; Location of private snippets
        '("~/.emacs.d/local/yasnippet/snippets"
          ;; Location of default snippets
          "~/.emacs.d/el-get/yasnippet/snippets"))
  (yas-global-mode 1)
  (custom-set-variables '(yas-trigger-key "TAB"))
  )

(use-package company-yasnippet)
