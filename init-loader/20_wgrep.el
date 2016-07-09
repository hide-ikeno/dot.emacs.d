;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; file: 20_wgrep.el
;;; Description: Customize wgrep
;;;
;;; Code:

;;;=============================================================================
;;; wgrep --- Writable grep buffer and apply the changes to files
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
;; (el-get-bundle ag)
(el-get-bundle wgrep)
(use-package wgrep-ag
  :defines
  wgrep-enable-key
  wgrep-auto-save-buffer
  wgrep-change-readonly-file
  :config
  ;; r で wgrepモードにする (default "C-c C-p")
  (setf wgrep-enable-key "r")
  ;; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ;; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)
  )
