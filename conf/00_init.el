;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/00_init.el
;;; Description: Basic customization
;;;

;;==============================================================================
;; Basic setup
;;==============================================================================

;;; Highlight region
(setq transient-mark-mode t)

;;; 選択範囲の文字を置き換え
(delete-selection-mode t)

;;; 行頭で "C-k" すると，改行文字も kill する
(setq kill-whole-line 'always)

;;; visible bell
(setq visible-bell t)

;;; yes-or-no -> y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;; Tab width
(setq-default tab-width 4)

;;; Use C-h v or `Help->Commands, Variables, Keys->Describe Variable...'
;;; to find out what these variables mean.
(setq find-file-compare-truenames t
      minibuffer-max-depth nil)

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

;;==============================================================================
;; Customize some default keybinds
;;==============================================================================

;; C-h: BackSpace (<= help-for-help)
(keyboard-translate ?\C-h ?\C-?)

;; C-m newline-and-indent (<= newline)
(global-set-key (kbd "C-m") 'newline-and-indent)
;; C-t other-window (<= transpose-chars)
;; (global-set-key (kbd "C-t") 'other-window)

;; M-?, [f1]: help-for-help
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key [f1] 'help-for-help)

;; M-h backward-kill-word (<= mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)
;; M-H mark-paragraph
(global-set-key (kbd "M-H") 'mark-paragraph)
;; M-g goto-line
(global-set-key (kbd "M-g") 'goto-line)

;;; 日本語でインクリメンタルサーチ
(define-key isearch-mode-map (kbd "C-k") 'isearch-edit-string)

;;; CUA mode -- 矩形選択用
(cua-mode t)
(setq cua-enable-cua-keys nil)
