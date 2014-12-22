;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_lang.el
;;; Description: Customize major mode for programing languages
;;;
;;; Code:

;; (el-get 'sync '(visual-regexp smartrep multiple-cursors))
(el-get 'sync '(visual-regexp wgrep))

;;;=============================================================================
;;; visual-regexp --- A regexp/replace command for Emacs with interactive
;;; visual feedback <https://github.com/benma/visual-regexp.el>
;;;=============================================================================
(when (require 'visual-regexp nil t)
  (global-set-key (kbd "M-%") 'vr/query-replace)
  )

;;;=============================================================================
;;; wgrep --- Writable grep buffer and apply the changes to files
;;;=============================================================================
(use-package wgrep)

;;;=============================================================================
;;; smartrep
;;;   <http://sheephead.homelinux.org/2011/12/19/6930/>
;;; multiple-cursors -- Multiple cursors for Emacs
;;;   <https://github.com/magnars/multiple-cursors.el>
;;;============================================================================

;; (when (require 'multiple-cursors nil t)
;;   (when (require 'smartrep nil t)

;;     (declare-function smartrep-define-key "smartrep")

;;     ;; 入力した文字列にマッチするリージョン内の部分をマークする
;;     (global-set-key (kbd "C-M-c") 'mc/mark-all-in-region)
;;     ;; 入力した正規表現にマッチするリージョン内の部分をマークする
;;     (global-set-key (kbd "C-M-r") 'mc/mark-all-in-region-regexp)

;;     (global-unset-key (kbd "C-t"))

;;     (smartrep-define-key global-map "C-t"
;;                          '(("C-t" . 'mc/mark-next-like-this)
;;                            ("C-n" . 'mc/mark-next-like-this)
;;                            ("C-p" . 'mc/unmark-next-like-this)
;;                            ("C-u" . 'mc/unmark-next-like-this)
;;                            ("C-s" . 'mc/skip-to-next-like-this)
;;                            ("C-*" . 'mc/mark-all-like-this)
;;                            ("C-d" . 'mc/mark-all-like-this-dwim)
;;                            ("C-i" . 'mc/insert-numbers)
;;                            ;; 以降の設定の Metaキー は、ESC 以外のキーを利用すること
;;                            ("M-f" . 'forward-char)
;;                            ("M-b" . 'backward-char)
;;                            ("C-v" . 'scroll-up-command)
;;                            ("M-v" . 'scroll-down-command)
;;                            ("C-l" . 'recenter-top-bottom)
;;                            ;; IM の切替えコマンドを指定する
;;                            ("C-o" . 'toggle-input-method)))
;;     ))
