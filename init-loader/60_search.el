;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 60_search.el
;;; Description: Customize search commands, like isearch and occur.
;;;
;;; Code:

;;;=============================================================================
;;; Avy -- Jump to things in Emacs tree-style
;;;   <https://github.com/abo-abo/avy>
;;;=============================================================================
(el-get-bundle avy)

(use-package avy
  :defines
  avy-background
  add-keys-to-avy
  :commands (avy-goto-char
             avy-goto-char-2
             avy-goto-word-1)
  :init
  (defun add-keys-to-avy (prefix c &optional mode)
    (define-key global-map
      (read-kbd-macro (concat prefix (string c)))
      `(lambda ()
         (interactive)
         (funcall (if (eq ',mode 'word)
                      #'avy-goto-word-1
                    #'avy-goto-char) ,c))))
  :config
  ;; Darken background
  (setq avy-background t)
  ;;
  ;; avy version of one-step activation
  ;; http://d.hatena.ne.jp/rkworks/20120520/1337528737
  ;;
  ;; Assing key bindings for all characters
  ;; eg, A-s-x will activate (avy-goto-char ?x), ie, all occurrence of x
  (loop for c from ?! to ?~ do (add-keys-to-avy "A-s-" c))
  ;; eg, M-s-x will activate (avy-goto-word-1 ?x), ie, all words starting with x
  (loop for c from ?! to ?~ do (add-keys-to-avy "M-s-" c 'word))
  )

;; ;;;=============================================================================
;; ;;; imenus.el --- Imenu for multiple buffers
;; ;;;=============================================================================
;; (el-get-bundle imenus)
;; ;; See, http://rubikitch.com/2015/04/09/imenus/
;; (use-package imenus
;;   :config
;;   ;; エラー対策
;;   (defun imenu-find-default--or-current-symbol (&rest them)
;;     (condition-case nil
;;         (apply them)
;;       (error (thing-at-point 'symbol))))
;;   (advice-add 'imenu-find-default :around 'imenu-find-default--or-current-symbol)
;;   ;; なぜか現在のシンボルを取ってくれないから
;;   (defun imenus-exit-minibuffer ()
;;     (exit-minibuffer))

;;   ;; ido化: imenus/with-ido imenus-mode-buffers/with-idoを定義
;;   (with-ido-completion imenus)
;;   ;; C-M-s C-M-sで現在のシンボルを helm-multi-swoop できるよ！
;;   (bind-key "C-M-s" (with-ido-completion imenus-mode-buffers))

;;   ;; M-oでのmulti-occurをシンボル正規表現にするよう改良
;;   (push '(occur . imenus-ido-multi-occur) imenus-actions)
;;   (defun imenus-ido-multi-occur (buffers input)
;;     (multi-occur buffers
;;                  (format "\\_<%s\\_>"
;;                          (regexp-quote (replace-regexp-in-string "^.*|" "" input)))))

;;   ;; C-M-sで関数呼び出しを helm-multi-swoop できるようにした
;;   (use-package helm-swoop
;;     :defines
;;     imenus-actions
;;     imenus-minibuffer-map
;;     imenus-exit-status
;;     :functions
;;     imenus-exit-minibuffer
;;     :config
;;     (push '(helm-multi-swoop . imenus-helm-multi-swoop) imenus-actions)
;;     (defun imenus-helm-multi-swoop (buffers input)
;;       (helm-multi-swoop (replace-regexp-in-string "^.*|" "" input)
;;                         (mapcar 'buffer-name buffers)))
;;     (bind-key "C-M-s" 'imenus-exit-to-helm-multi-swoop imenus-minibuffer-map)
;;     (defun imenus-exit-to-helm-multi-swoop ()
;;       "Exit from imenu prompt; start `helm-multi-swoop' with the current input."
;;       (interactive)
;;       (setq imenus-exit-status 'helm-multi-swoop)
;;       (imenus-exit-minibuffer))
;;     )
;;   )

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
  :defines wgrep-enable-key wgrep-auto-save-buffer wgrep-change-readonly-file
  :config
  ;; r で wgrepモードにする (default "C-c C-p")
  (setf wgrep-enable-key "r")
  ;; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ;; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)
  )
