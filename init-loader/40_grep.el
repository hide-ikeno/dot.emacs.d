;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 40_grep.el
;;; Description: Customize grep and related commands
;;;
;;; Code:

;;;=============================================================================
;;; helm-ag
;;;=============================================================================
(el-get-bundle helm-ag)
(use-package helm-ag
  ;; C-M-g -> helm-ag
  ;; C-M-k -> backward-kill-sexp (remap)
  :bind (("C-M-g" . helm-ag)
         ("C-M-k" . backward-kill-sexp))
  :config
  ;; 現在のシンボルをデフォルトのクエリにする
  (setq helm-ag-insert-at-point 'symbol)
  (defun helm-ag-dot-emacs ()
     ".emacs.d以下を検索"
     (interactive)
     (helm-ag "~/.emacs.d/"))
  (require 'projectile nil t)
  (defun helm-projectile-ag ()
     "Projectileと連携"
     (interactive)
     (helm-ag (projectile-project-root)))
  )

;;;=============================================================================
;;; wgrep --- Writable grep buffer and apply the changes to files
;;; wgrep-helm --- helm interface of wgrep
;;;=============================================================================
;; C-c C-p : Edit *grep* buffer (default)
;; C-c C-e : Apply the changes to file buffers.
;; C-c C-u : All changes are unmarked and ignored.
;; C-c C-d : Mark as delete to current line (including newline).
;; C-c C-r : Remove the changes in the region (these changes are not
;;           applied to the files. Of course, the remaining
;;           changes can still be applied to the files.)
;; C-c C-p : Toggle read-only area.
;; C-c C-k : Discard all changes and exit.
;; C-x C-q : Exit wgrep mode.
(use-package wgrep-helm
  :config
  ;; r で wgrepモードにする (default "C-c C-p")
  (setf wgrep-enable-key "r")
  ;; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ;; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)
  )

