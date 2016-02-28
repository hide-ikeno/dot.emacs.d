;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 34_imenus.el
;;; Description: Setup helm
;;;

(el-get-bundle ido-occasional)
(el-get-bundle ido-vertical-mode)

;;;=============================================================================
;;; ido-occasional --- Use ido where you choose
;;;=============================================================================
;;; このときidoが使うwindowの高さは大きくした方がいい
(use-package ido
  :defines
  ido-max-window-height
  ido-enable-flex-matching
  :config
  ;; ido-vertical を使うために window サイズは高めに設定
  (setq ido-max-window-height 0.75)
  ;; あいまいマッチを使う
  (setq ido-enable-flex-matching t)
  ;; ido-occasional
  (use-package ido-occasional)
  )

;;;=============================================================================
;;; ido-vertical-mode --- Makes ido-mode display vertically.
;;;=============================================================================
(use-package ido-vertical-mode
  :commands ido-vertical-mode
  :init    (ido-vertical-mode 1)
  )
