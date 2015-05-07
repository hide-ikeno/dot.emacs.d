;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/20_migemo.el
;;; Description: Setup migemo
;;;

;;;=============================================================================
;;; migemo -- Japanese incremental search through dynamic pattern expansion
;;;=============================================================================

(el-get-bundle migemo)
(use-package migemo
  :defines
  migemo-command migemo-options migemo-dictionary
  migemo-user-dictionary migemo-regex-dictionary
  migemo-coding-system migemo-use-pattern-alist
  migemo-use-frequent-pattern-alist migemo-pattern-alist-length
  :functions migemo-init
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  ;; migemo-dict のパスを指定
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  ;; キャッシュ機能を利用する
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (setq migemo-pattern-alist-length 1024)
  :init
  ;; 起動時に初期化も行う
  (load-library "migemo")
  (migemo-init)
  )
