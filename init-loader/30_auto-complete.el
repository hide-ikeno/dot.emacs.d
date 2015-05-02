;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 30_auto-complete.el
;;; Description: Setup Auto Complete mode
;;;
;;;=============================================================================
;;; Auto Complete -- An Intelligent auto-completion extension for Emacs
;;;   <https://github.com/auto-complete/auto-complete>
;;;=============================================================================
(el-get-bundle auto-complete)

(use-package auto-complete-config
  :defines ac-sources ac-delay ac-use-fuzzy ac-use-menu-map
  ac-dictionary-directories ac-completing-map
  :config
  ;; (add-to-list 'ac-modes 'text-mode)
  ;; (add-to-list 'ac-modes 'fundamental-mode)

  ;; (setq ac-auto-start nil)  ;; 補完を自動的に開始しない
  ;; (ac-set-trigger-key "TAB") ;; コンテキストに応じてTABで補完
  (setq ac-delay 0.3)
  (setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
  (setq ac-use-fuzzy t)          ;; 曖昧マッチ
  ;; ユーザー定義辞書を置くディレクトリ
  (add-to-list 'ac-dictionary-directories (locate-user-emacs-file "ac-dict"))
  ;; キーバインド
  (bind-keys :map ac-completing-map
             ("C-n" . ac-next)          ; 次候補の選択
             ("C-p" . ac-previous)      ; 前候補の選択
             ("TAB" . ac-complete))     ; TAB で補完完了
  (ac-config-default)
  )

;;;=============================================================================
;;; ac-dabbrev --- auto-complete.el source for dabbrev
;;;=============================================================================
(el-get-bundle ac-dabbrev)
(use-package ac-dabbrev
  :config
  (add-to-list 'ac-sources 'ac-source-dabbrev))

;;;=============================================================================
;;; ac-math --- Auto-complete sources for input of mathematical symbols and
;;; latex tags
;;;=============================================================================
(el-get-bundle ac-math)
(use-package ac-math)
