;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/01_keybindings.el
;;; Description: Customize keybinding
;;;

;;==============================================================================
;; Customize some default keybinds
;;==============================================================================

;; C-h: BackSpace (<= help-for-help)
(keyboard-translate ?\C-h ?\C-?)

;; C-m newline-and-indent (<= newline)
(global-set-key (kbd "C-m") 'newline-and-indent)

;; C-l recenter-top-bottom
(global-set-key (kbd "C-l") 'recenter-top-bottom)

;; C-t other-window (<= transpose-chars)
;; (global-set-key (kbd "C-t") 'other-window)

;; M-?, [f1]: help-for-help
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key [f1] 'help-for-help)

;; M-h backward-kill-word (<= mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)
;; M-H mark-paragraph
(global-set-key (kbd "M-H") 'mark-paragraph)
;; ;; M-g goto-line
;; (global-set-key (kbd "M-g") 'goto-line)

;;; 日本語でインクリメンタルサーチ
(define-key isearch-mode-map (kbd "C-k") 'isearch-edit-string)

;; ;;; CUA mode -- 矩形選択用
;; (cua-mode t)
;; (setq cua-enable-cua-keys nil)

