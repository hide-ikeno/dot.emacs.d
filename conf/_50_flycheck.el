;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_flycheck.el
;;; Description: Customize flycheck
;;;
;;; Code:

(el-get 'sync '(flycheck flycheck-pos-tip))

(use-package flycheck
  :config
  ;; C/C++
  (add-hook 'c++-mode-hook
            (lambda ()
              (setq flycheck-clang-language-standard "c++11")
              (setq flycheck-clang-standard-library "libc++")
              (setq flycheck-clang-include-path
                    (list ("/usr/local/include/")))))
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )
