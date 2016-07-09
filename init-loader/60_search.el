;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; file: 60_search.el
;;; Description: Customize search commands, like isearch and occur.
;;;
;;; Code:

;;;=============================================================================
;;; Avy -- Jump to things in Emacs tree-style
;;;   <https://github.com/abo-abo/avy>
;;;=============================================================================
(el-get-bundle avy)

(use-package avy
  :demand
  :defines
  avy-background
  :commands
  avy-goto-char
  avy-goto-char-2
  avy-goto-word-1
  add-keys-to-avy
  :config
  ;; Darken background
  (setq avy-background t)
  ;;
  ;; avy version of one-step activation
  ;; http://d.hatena.ne.jp/rkworks/20120520/1337528737
  (defun add-keys-to-avy (prefix c &optional mode)
    (define-key global-map
      (read-kbd-macro (concat prefix (string c)))
      `(lambda ()
         (interactive)
         (funcall (if (eq ',mode 'word)
                      #'avy-goto-word-1
                    #'avy-goto-char) ,c))))
  ;;
  ;; Assing key bindings for all characters
  ;; eg, A-s-x will activate (avy-goto-char ?x), ie, all occurrence of x
  (loop for c from ?! to ?~ do (add-keys-to-avy "M-s-" c))
  ;; eg, M-s-x will activate (avy-goto-word-1 ?x), ie, all words starting with x
  (loop for c from ?! to ?~ do (add-keys-to-avy "M-s-S-" c 'word))
  )

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
