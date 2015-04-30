;; Setup view-mode
(use-package view
  :config
  ;; 読み込み専用ファイルを view-mode で開く
  (setq view-read-only t)
  (bind-keys :map view-mode-map
             ;; less 感覚の操作
             ("f" . View-scroll-page-forward)
             ("b" . View-scroll-page-backward)
             ("n" . View-search-last-regexp-forward)
             ("N" . View-search-last-regexp-backward)
             ("?" . View-search-regexp-backward)
             ("G" . View-goto-line-last)
             ;; vi/w3m 感覚の操作
             ("h" . backward-char)
             ("j" . next-line)
             ("k" . previous-line)
             ("l" . forward-char)
             ("J" . View-scroll-line-forward)
             ("K" . View-scroll-line-backward))
  )

;; Viewer
(use-package viewer
  :config
  ;; 書き込み不能なファイルでは view-mode から抜けない
  (viewer-stay-in-setup)
  ;; view-mode 時に modeline に色を付ける
  (setq viewer-modeline-color-unwritable "tomato3")
  (setq viewer-modeline-color-view "red4")
  (viewer-change-modeline-color-setup)
  )
