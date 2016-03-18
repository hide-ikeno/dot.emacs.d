;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/30_view.el
;;; Description: Customize view, viewer
;;;

;;;=============================================================================
;;; bm.el -- bookmark file
;;;=============================================================================
(el-get-bundle bm)
(use-package bm)

;;;=============================================================================
;;; view.el -- view mode
;;;=============================================================================
(use-package view
  :commands
  View-scroll-page-forward
  View-scroll-page-backward
  View-search-last-regexp-forward
  View-search-last-regexp-backward
  View-search-regexp-forward
  View-goto-line-last
  View-scroll-line-forward
  View-scroll-line-backward
  :bind
  (:map view-mode-map
        ;; less-like
        ("f" . View-scroll-page-forward)
        ("b" . View-scroll-page-backward)
        ("n" . View-search-last-regexp-forward)
        ("N" . View-search-last-regexp-backward)
        ("?" . View-search-regexp-backward)
        ("G" . View-goto-line-last)
        ;; vi/w3m-like
        ("h" . backward-char)
        ("j" . next-line)
        ("k" . previous-line)
        ("l" . forward-char)
        ("J" . View-scroll-line-forward)
        ;; bm-easy
        ("." . bm-toggle)
        ("[" . bm-previous)
        ("]" . bm-next)
        )
  :config
  ;; 読み込み専用ファイルを view-mode で開く
  (use-package bm)
  (setq view-read-only t)
  )

;; Viewer
(el-get-bundle viewer)
(use-package viewer
  :defines viewer-modeline-color-view viewer-modeline-color-unwritable
  :functions viewer-stay-in-setup  viewer-change-modeline-color-setup
  :config
  ;; 書き込み不能なファイルでは view-mode から抜けない
  (viewer-stay-in-setup)
  ;; view-mode 時に modeline に色を付ける
  (setq viewer-modeline-color-unwritable "tomato3")
  (setq viewer-modeline-color-view "red4")
  (viewer-change-modeline-color-setup)
  )
