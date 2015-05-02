;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/00_init.el
;;; Description: Basic customization
;;;

;;==============================================================================
;; Basic setup
;;==============================================================================

;;; visible bell
(setq visible-bell t)

;;; yes-or-no -> y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;; 選択範囲の文字を置き換え
(delete-selection-mode t)

;;; 行頭で "C-k" すると，改行文字も kill する
(setq kill-whole-line 'always)

;;; Tab width
(setq-default tab-width 4)

;;; テキストを折り返す
(setq truncate-lines t)
(setq truncate-partial-width-windows t)

;;; 値を評価して得られるリストの表示を省略しない
(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;;; find-fileのファイル名補完で大文字小文字を区別しない
(setq read-file-name-completion-ignore-case t)

;;; 圧縮されたファイルを開く (こうしないと圧縮された日本語infoが読めない)
(auto-compression-mode t)

;;; 画像の表示
(if (>= emacs-major-version 21)
    (auto-image-file-mode t))

;;; auto-fill 段落整形時の折り返しの文字数
;; memo: M-q で段落の整形
(setq-default fill-column 80)

;;; 行頭の空白を段落の区切りとして認識させる
(setq paragraph-start '"^\\([ 　・○<\t\n\f]\\|(?[0-9a-zA-Z]+)\\)")

;;; 履歴数を大きくする
(setq history-length 10000)

