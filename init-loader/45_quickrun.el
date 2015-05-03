;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 45_quickrun.el
;;; Description: Setup quickrun
;;;
;;; Code:

;;;=============================================================================
;;; quickrun --- Run command quickly (Emacs port of quickrun.vim)
;;;=============================================================================
(el-get-bundle quickrun)

(use-package quickrun
  :config
  ;; Use this parameter as C++ default
  (quickrun-add-command "c++11/clang++"
                        '((:command . "clang++")
                          (:exec    . ("%c -std=c++11 -stdlib=libc++ %o -o %e %s" "%e %a"))
                          (:compile-only . "%c -Wall -Werror %o -o %e %s")
                          (:remove  . ("%e")))
                        :default "c++")
  )
