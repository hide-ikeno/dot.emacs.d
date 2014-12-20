;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/05_init.el
;;; Description: Look & Feel
;;;

;; install external packages
(el-get 'sync '(visual-regexp rainbow-delimiters anzu volatile-highlights))

;;;=============================================================================
;;; Modeline & frame customization
;;;=============================================================================

;;; Inhibit startup message
(setq inhibit-startup-screen t)

;;; Inhibit toolbar
(tool-bar-mode 0)

;;; Inhibit scroll-bar
(scroll-bar-mode 0)

;;; Inhibit menu bar
(menu-bar-mode 0)

;;; Display file size on modeline
(size-indication-mode t)
;;; Display clock on modeline
(setq display-time-day-and-date t)
(display-time)

;;; Show line numbers and column numbers
(line-number-mode t)                    ; show line number on modeline
(column-number-mode t)                  ; show column number on modeline

;; 対応する括弧の強調
(show-paren-mode t)
(setq show-paren-style 'mixed)
(setq show-paren-style 'expression)
;; ;; マッチした場合の色
;; (set-face-background 'show-paren-match-face "dodger blue")
;; (set-face-foreground 'show-paren-match-face "white")
;; ;; マッチしていない場合の色
;; (set-face-background 'show-paren-mismatch-face "Red")
;; (set-face-foreground 'show-paren-mismatch-face "black")

;;;=============================================================================
;;; linum-mode -- show line numbers
;;;=============================================================================
(use-package linum
  :config
  (global-linum-mode t)
  )
;; (if (require 'ruler-mode nil t)
;;     (ruler-mode t))

;;;=============================================================================
;;; whitespace -- 空白や長すぎる行を視覚化する
;;;=============================================================================
(use-package whitespace
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style
        '(face           ; faceを使って視覚化する
          tabs
          tab-mark
          spaces
          space-mark
          trailing         ; 行末の空白を対象とする
          lines-tail       ; 長すぎる行のうち
                                        ; whitespace-line-column
                                        ; 以降のみを対象とする
          space-before-tab ; タブの前にあるスペースを対象とする
          space-after-tab  ; タブの後にあるスペースを対象とす
          ))
  ;; 全角スペースを視覚化
  (setq whitespace-space-regexp "\\(\x3000+\\)")
  (setq whitespace-display-mappings
        '((space-mark ?\x3000 [?\□])
          (tab-mark   ?\t   [?\xBB ?\t])
          ))
  (global-whitespace-mode 1)
  )

;; デフォルトで視覚化を有効にする。

;;;=============================================================================
;;; uniquify -- 同名バッファを分かり易く
;;;=============================================================================
(use-package uniquify)

;;;============================================================================
;;; visual-regexp
;;;   A regexp/replace command for Emacs with interactive visual feedback
;;;   <https://github.com/benma/visual-regexp.el>
;;;============================================================================
(use-package visual-regexp
  :bind ("M-%" . vr/query-replace))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;;
;;; anzu -- Emacs Port of anzu.vim
;;;
(use-package anzu
  :config (global-anzu-mode t))

;;;=============================================================================
;;; volatile-highlights -- Minor mode for visual feedback on some operations in
;;; Emacs
;;;=============================================================================
(use-package volatile-highlights
  :config
  (volatile-highlights-mode t)
  )
