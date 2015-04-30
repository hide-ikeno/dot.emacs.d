;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/10_history.el
;;; Description: Customize history
;;;

;;; 履歴数を大きくする
(setq history-length 10000)

;;;=============================================================================
;;; files.el
;;;=============================================================================
;; Disable automatic backup
(setq make-backup-files nil)
;; Disable automatic save
(setq auto-save-default nil)


;;;=============================================================================
;;; recenrf, recenrf-ext -- 最近使ったファイルを記憶させる
;;;=============================================================================
(el-get-bundle recentf-ext)

(use-package recentf-ext
  :config
  (setq recentf-save-file (expand-file-name (locate-user-emacs-file ".recentf")))
  (setq recentf-max-saved-items 2000)
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  )

;;;=============================================================================
;;; saveplace - 前回編集していたカーソル位置を記憶
;;;=============================================================================
(use-package saveplace
  :config
  (setq-default save-place t)
  (setq save-place-file (locate-user-emacs-file ".emacs-places"))
  )

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

