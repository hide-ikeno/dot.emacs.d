;; C-c C-t -- 現在書いているreST内の見出し(toc; table of contents)を表示
;; C-=, C-- C-=                       自動見出しレベル設定（C-- C-=で逆順）
;; (リージョン設定後) C-c C-c          選択範囲をコメントアウトする
;; (リージョン設定後) C-c C-r, C-c C-l インデントレベルを深くする／浅くする
;; (リージョン設定後) C-c C-e, C-c C-b すべての行を数字リスト／箇条書きにできる
;; (リージョン設定後) C-c C-d          行ブロックを設定する
;; (リージョン設定後) C-x r t          リージョン中の各行頭へ指定文字列挿入
(use-package rst
  :mode (("\\.rst$"  . rst-mode)
         ("\\.rest$" . rst-mode))
  :config
  ;; 背景が黒い場合はこうしないと見出しが見づらい
  (setq frame-background-mode 'dark)
  ;; 全部スペースでインデントしましょう
  (add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))
  )
