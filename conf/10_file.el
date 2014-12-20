;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/10_history.el
;;; Description: Customize history
;;;
(el-get 'sync '(recentf-ext))

;;; 履歴数を大きくする
(setq history-length 10000)

;;;=============================================================================
;;; recenrf - 最近使ったファイルを記憶させる
;;;=============================================================================
(require 'recentf)
(setq recentf-save-file (expand-file-name "~/.emacs.d/.recentf"))
(setq recentf-max-saved-items 2000)
(recentf-mode 1)

;;; recentf-ext -- Extention for recentf
(use-package recentf-ext)

;;;=============================================================================
;;; saveplace - 前回編集していたカーソル位置を記憶
;;;=============================================================================
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.emacs-places")

;;;=============================================================================
;;; filecache
;;;=============================================================================
(use-package filecache
  :config
  (file-cache-add-directory-list
   (list "~"
         "~/bin"
         "~/program/"
         ))
  (bind-keys :map minibuffer-local-completion-map
             ("\C-c\C-i" . file-cache-minibuffer-complete))
  )

