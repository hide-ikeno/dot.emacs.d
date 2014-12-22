;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/10_history.el
;;; Description: Customize history
;;;

;;; 履歴数を大きくする
(setq history-length 10000)

;;; recentf - 最近使ったファイルを記憶させる
(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name "~/.emacs.d/.recentf"))
  (setq recentf-max-saved-items 2000)
  (recentf-mode 1)
  )
(use-package recentf-ext)

;;; saveplace - 前回編集していたカーソル位置を記憶
(use-package saveplace
  :config
  (setq-default save-place t)
  (setq save-place-file "~/.emacs.d/.emacs-places")
  )
