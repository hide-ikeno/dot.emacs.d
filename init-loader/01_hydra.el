;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/01_hydra.el
;;; Description: Hydra setup
;;;
;;: Code:

;;;=============================================================================
;;; Hydra --- Make bindings that stick around.
;;;=============================================================================
(el-get-bundle! hydra)
;; (use-package hydra
;;   :init
;;   ;; -- Zoom in/out (from hydra-examples.el)
;;   (defhydra hydra-zoom (global-map "<f2>")
;;     "zoom"
;;     ("g" text-scale-increase "in")
;;     ("l" text-scale-decrease "out")))

(use-package hydra
  :config
  (use-package lv)
  ;; -- Zoom in/out (from hydra-examples.el)
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))
  )

