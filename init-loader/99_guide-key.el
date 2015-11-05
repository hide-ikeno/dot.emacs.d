;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/99_guide-key.el
;;; Description: Basic setup for guide-key
;;;
;;; Code:

(el-get-bundle guide-key)
;; (eval-when-compile
;;   (require 'popwin))

(use-package guide-key
  :defines
  guide-key/guide-key-sequence
  guide-key/idle-delay
  guide-key/popup-window-position
  guide-key/highlight-command-regexp
  :commands
  guide-key/add-local-guide-key-sequence
  guide-key/add-local-highlight-command-regexp
  :init
  (guide-key-mode 1)
  :config
  ;; 1秒後にポップアップされる(デフォルト)
  ;; つまり1秒以内に操作すればポップアップされずに実行される
  (setq guide-key/idle-delay 1.0)
  ;; 下部にキー一覧を表示させる (default: right)
  (setq guide-key/popup-window-position 'bottom)
  ;; guilde-keyを発動させるプレフィクスキー
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
  ;; コマンド名にこれらが含まれている場合はハイライトされる
  (setq guide-key/highlight-command-regexp "rectangle\\|register")
  ;; 文字の大きさを変更する(正の数で大きく、負の数で小さく)
  ;; (setq guide-key/text-scale-amount -1)

  ;; -- org-mode
  (defun guide-key/my-hook-function-for-org-mode ()
    (guide-key/add-local-guide-key-sequence "C-c")
    (guide-key/add-local-guide-key-sequence "C-c C-x")
    (guide-key/add-local-highlight-command-regexp "org-"))
  (add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)

  ;; -- pandoc-mode
  (defun guide-key/my-hook-function-for-pandoc-mode ()
    (guide-key/add-local-guide-key-sequence "C-c /")
    (guide-key/add-local-highlight-command-regexp "pandoc-"))
  (add-hook 'pandoc-mode-hook 'guide-key/my-hook-function-for-pandoc-mode)

  ;; -- rst-mode
  (defun guide-key/my-hook-function-for-rst-mode ()
    (guide-key/add-local-guide-key-sequence "C-c")
    (guide-key/add-local-guide-key-sequence "C-c C-x")
    (guide-key/add-local-highlight-command-regexp "rst-"))
  (add-hook 'rst-mode-hook 'guide-key/my-hook-function-for-rst-mode)
  (add-hook 'rst-minor-mode-hook 'guide-key/my-hook-function-for-rst-mode)

  ;; -- flycheck
  (defun guide-key/my-hook-function-for-flycheck-mode ()
    (guide-key/add-local-guide-key-sequence "C-c")
    (guide-key/add-local-guide-key-sequence "C-c !")
    (guide-key/add-local-highlight-command-regexp "flycheck-"))
  (add-hook 'flycheck-mode-hook 'guide-key/my-hook-function-for-flycheck-mode)

  ;; -- projectile
  (defun guide-key/my-hook-function-for-projectile ()
    (guide-key/add-local-guide-key-sequence "C-c p")
    (guide-key/add-local-highlight-command-regexp "projectile-"))
  (add-hook 'projectile-mode-hook 'guide-key/my-hook-function-for-projectile)

  ;; -- doxymacs
  (defun guide-key/my-hook-function-for-doxymacs ()
    (guide-key/add-local-guide-key-sequence "C-c")
    (guide-key/add-local-guide-key-sequence "C-c d")
    (guide-key/add-local-highlight-command-regexp "doxymacs-"))
  (add-hook 'c-common-mode-hook 'guide-key/my-hook-function-for-doxymacs)
  )
