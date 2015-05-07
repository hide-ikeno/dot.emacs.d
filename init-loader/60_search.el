;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 60_search.el
;;; Description: Customize search commands, like isearch and occur.
;;;
;;; Code:

;;;=============================================================================
;;; helm-swoop --- Efficiently hopping squeezed lines powered by helm interface
;;;=============================================================================
(el-get-bundle helm-swoop)

(use-package helm-swoop
  :defines
  helm-multi-swoop-edit-save
  helm-swoop-split-with-multiple-windows
  helm-swoop-split-direction
  helm-swoop-speed-or-color
  helm-swoop-move-to-line-cycle
  helm-swoop-use-line-number-face
  helm-swoop-map
  :config
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)
  ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)
  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; From helm-swoop to helm-multi-swoop-all
  (bind-keys :map helm-swoop-map
             ("M-o" . helm-multi-swoop-all-from-helm-swoop)
             ("C-s" . swoop-action-goto-line-next)
             ("C-r" . swoop-action-goto-line-prev))

  ;; C-s -> isearch-forward
  ;; C-u C-s -> helm-swoop
  ;; C-u C-u C-s -> helm-swoop-nomigemo
  ;;   <http://rubikitch.com/2015/03/23/helm-swoop-update/>
  (defun isearch-forward-or-helm-swoop (use-helm-swoop)
    (interactive "p")
    (let (current-prefix-arg
          (helm-swoop-pre-input-function 'ignore))
      (call-interactively
       (case use-helm-swoop
         (1 'isearch-forward)
         (4 'helm-swoop)
         (16 'helm-swoop-nomigemo)))))
  (bind-key "C-s" 'isearch-forward-or-helm-swoop)
  )


;;;=============================================================================
;;; ace-jump-mode -- a quick cursor jump mode for emacs
;;;=============================================================================
(el-get-bundle ace-jump-mode)
(use-package ace-jump-mode)

;;;=============================================================================
;;; ace-isearch -- A seamless bridge between isearch and ace-jump-mode
;;;=============================================================================
(el-get-bundle ace-isearch)
(use-package ace-isearch
  :defines ace-isearch-input-idle-delay ace-isearch-use-function-from-isearch
  :commands global-ace-isearch-mode
  :init
  (global-ace-isearch-mode t)
  ;; isearch-mode から M-o で helm-swoop を起動
  (bind-key "M-o" 'helm-multi-swoop-all-from-isearch isearch-mode-map)
  :config
  (setq ace-isearch-input-idle-delay 0.5)
  ;; helm-swoop は自動的に起動しない
  (setq ace-isearch-use-function-from-isearch nil)
  )

;;;=============================================================================
;;; isearch-dabbrev -- Use dabbrev-expand within isearch
;;;=============================================================================
(el-get-bundle isearch-dabbrev)
(use-package isearch-dabbrev
  :init (bind-key "TAB" 'isearch-dabbrev-expand isearch-mode-map)
  )

;;;=============================================================================
;;; imenus.el --- Imenu for multiple buffers
;;;=============================================================================
(el-get-bundle imenus)
;; See, http://rubikitch.com/2015/04/09/imenus/
(use-package imenus
  :config
  ;; エラー対策
  (defun imenu-find-default--or-current-symbol (&rest them)
    (condition-case nil
        (apply them)
      (error (thing-at-point 'symbol))))
  (advice-add 'imenu-find-default :around 'imenu-find-default--or-current-symbol)
  ;; なぜか現在のシンボルを取ってくれないから
  (defun imenus-exit-minibuffer ()
    (exit-minibuffer))

  ;; ido化: imenus/with-ido imenus-mode-buffers/with-idoを定義
  (with-ido-completion imenus)
  ;; C-M-s C-M-sで現在のシンボルを helm-multi-swoop できるよ！
  (bind-key "C-M-s" (with-ido-completion imenus-mode-buffers))

  ;; M-oでのmulti-occurをシンボル正規表現にするよう改良
  (push '(occur . imenus-ido-multi-occur) imenus-actions)
  (defun imenus-ido-multi-occur (buffers input)
    (multi-occur buffers
                 (format "\\_<%s\\_>"
                         (regexp-quote (replace-regexp-in-string "^.*|" "" input)))))

  ;; C-M-sで関数呼び出しを helm-multi-swoop できるようにした
  (use-package helm-swoop
    :defines
    imenus-actions
    imenus-minibuffer-map
    imenus-exit-status
    :functions
    imenus-exit-minibuffer
    :config
    (push '(helm-multi-swoop . imenus-helm-multi-swoop) imenus-actions)
    (defun imenus-helm-multi-swoop (buffers input)
      (helm-multi-swoop (replace-regexp-in-string "^.*|" "" input)
                        (mapcar 'buffer-name buffers)))
    (bind-key "C-M-s" 'imenus-exit-to-helm-multi-swoop imenus-minibuffer-map)
    (defun imenus-exit-to-helm-multi-swoop ()
      "Exit from imenu prompt; start `helm-multi-swoop' with the current input."
      (interactive)
      (setq imenus-exit-status 'helm-multi-swoop)
      (imenus-exit-minibuffer))
    )
  )

;;;=============================================================================
;;; helm-ag
;;;=============================================================================
(el-get-bundle helm-ag)
(use-package helm-ag
  ;; C-M-g -> helm-ag
  ;; C-M-k -> backward-kill-sexp (remap)
  :bind (("C-M-g" . helm-ag)
         ("C-M-k" . backward-kill-sexp))
  :defines helm-ag-insert-at-point
  :config
  ;; 現在のシンボルをデフォルトのクエリにする
  (setq helm-ag-insert-at-point 'symbol)
  (defun helm-ag-dot-emacs ()
     ".emacs.d以下を検索"
     (interactive)
     (helm-ag "~/.emacs.d/"))
  (use-package projectile
    :functions projectile-project-root
    :config
    (defun helm-projectile-ag ()
      "Projectileと連携"
      (interactive)
      (helm-ag (projectile-project-root))))
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
  :defines wgrep-enable-key wgrep-auto-save-buffer wgrep-change-readonly-file
  :config
  ;; r で wgrepモードにする (default "C-c C-p")
  (setf wgrep-enable-key "r")
  ;; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ;; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)
  )
