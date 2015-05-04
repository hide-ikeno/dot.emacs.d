;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 40_imenus.el
;;; Description: Setup helm
;;;

(el-get-bundle imenus)
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
  ;; C-M-s C-M-sで現在のシンボルをhelm-multi-swoopできるよ！
  (bind-key "C-M-s" (with-ido-completion imenus-mode-buffers))

  ;; M-oでのmulti-occurをシンボル正規表現にするよう改良
  (push '(occur . imenus-ido-multi-occur) imenus-actions)
  (defun imenus-ido-multi-occur (buffers input)
    (multi-occur buffers
                 (format "\\_<%s\\_>"
                         (regexp-quote (replace-regexp-in-string "^.*|" "" input)))))

  ;; C-M-sで関数呼び出しをhelm-multi-swoopできるようにした
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

