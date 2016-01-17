;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/05_highlights.el
;;; Description: Basic customization
;;;

;;;=============================================================================
;;; Customize for built-in functions and packages
;;;=============================================================================

;;; Highlight region
(setq transient-mark-mode t)
;; (set-face-background 'region "Blue")

;; 現在行をハイライト
(global-hl-line-mode t)

;;; 対応する括弧の強調 -- paren.el
(use-package paren
  :config
  (show-paren-mode t)
  (setq show-paren-style 'mixed)
  (setq show-paren-style 'expression)
  )

;; ;; マッチした場合の色
;; (set-face-background 'show-paren-match-face "dodger blue")
;; (set-face-foreground 'show-paren-match-face "white")
;; ;; マッチしていない場合の色
;; (set-face-background 'show-paren-mismatch-face "Red")
;; (set-face-foreground 'show-paren-mismatch-face "black")

;;;=============================================================================
;;; whitespace -- 空白や長すぎる行を視覚化する
;;;=============================================================================
(use-package whitespace
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style
        '(face                          ; faceを使って視覚化する
          tabs
          tab-mark
          spaces
          space-mark
          trailing                      ; 行末の空白を対象とする
          lines-tail                    ; 長すぎる行のうち
                                        ; whitespace-line-column
                                        ; 以降のみを対象とする
          space-before-tab              ; タブの前にあるスペースを対象とする
          space-after-tab               ; タブの後にあるスペースを対象とす
          ))
  ;; 全角スペースを視覚化
  (setq whitespace-space-regexp "\\(\x3000+\\)")
  (setq whitespace-display-mappings
        '((space-mark ?\x3000 [?\□])
          (tab-mark   ?\t   [?\xBB ?\t])
          ))
  ;; デフォルトで視覚化を有効にする。
  (global-whitespace-mode 1)
  )

;;;=============================================================================
;;; rainbow-delimiters -- Highlight brackets according to their depth
;;;=============================================================================
(el-get-bundle rainbow-delimiters)
(use-package rainbow-delimiters
  :functions rainbow-delimiters-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

;;;=============================================================================
;;; volatile-highlights -- Minor mode for visual feedback on some operations in
;;; Emacs
;;;=============================================================================
(el-get-bundle volatile-highlights)
(use-package volatile-highlights
  :functions volatile-highlights-mode
  :config
  (volatile-highlights-mode t)
  )


;;;=============================================================================
;;; highlight-symbol --- automatic and manual symbol highlighting for Emacs
;;;=============================================================================
(el-get-bundle highlight-symbol)
(use-package highlight-symbol
  :defines
  highlight-symbol-idle-delay
  :functions
  highlight-symbol-mode
  highlight-symbol-nav-mode
  highlight-symbol-query-replace
  :config
  ;; 1秒後自動ハイライトされるようになる
  (setq highlight-symbol-idle-delay 1.0)
  ;; 自動ハイライトをしたいならば
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  ;; ソースコードにおいてM-p/M-nでシンボル間を移動
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
  ;; シンボル置換
  :bind
  ("M-s M-r" . highlight-symbol-query-replace)
  )

