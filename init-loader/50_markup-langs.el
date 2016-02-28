;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_python.el
;;; Description: Major mode for other langulage
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Pandoc Mode
;;;   <http://joostkremers.github.io/pandoc-mode/>
;;;=============================================================================
;; C-c/r ~ Run pandoc on the document (pandoc-run-pandoc)
;; C-c/p ~ Run markdown2pdf on the document (pandoc-convert-to-pdf)
;; C-c/s ~ Save the settings file (pandoc-save-settings-file)
;; C-c/w ~ Set the output format (pandoc-set-write)
;; C-c/m ~ Set a metadata item (pandoc-set-metadata)
;; C-c/v ~ Set a template variable (pandoc-set-variable)
;; C-c/V ~ View the output buffer (pandoc-view-output)
;; C-c/S ~ View the current settings (pandoc-view-settings)
;; C-c/c ~ Insert a new (@)-item (pandoc-insert-@)
;; C-c/C ~ Select and insert a (@)-label (pandoc-select-@)

;; (el-get-bundle pandoc-mode
;;   :depend hydra)
;; (use-package pandoc-mode
;;   :config
;;   (add-hook 'markdown-mode-hook 'pandoc-mode)
;;   )

;;;=============================================================================
;;; YAML mode --- YAML Ain't Markup Language
;;;   <http://yaml-mode.clouder.jp/>
;;;=============================================================================
(el-get-bundle yaml-mode)
(use-package yaml-mode
  :defines yaml-mode-map
  :mode (("\\.yml$"  . yaml-mode)
         ("\\.yaml$" . yaml-mode))
  :config
  (bind-keys :map yaml-mode-map
             ("\C-m" . newline-and-indent))
  )

;;;=============================================================================
;;; TOML mode --- Mojor mode for editing TOML files
;;;=============================================================================
(el-get-bundle toml-mode)
(use-package toml-mode)

;;;=============================================================================
;;; Markdown Mode
;;;   <http://jblevins.org/projects/markdown-mode/>
;;;=============================================================================
(el-get-bundle markdown-mode)
(use-package markdown-mode
  :defines
  gfm-mode-hook
  markdown-command
  markdown-command-needs-filename
  markdown-enable-math
  ;; Major mode for editing Github Fravored Markdown
  :mode (("\\.text\\'"     . gfm-mode)
         ("\\.markdown\\'" . gfm-mode)
         ("\\.md\\'"       . gfm-mode))
  :config
  (setq markdown-command "/usr/local/var/pyenv/shims/grip --export"
        markdown-command-needs-filename t
        markdown-enable-math t)
  )

;;;=============================================================================
;;; rst-mode -- major mode for editing reStructuredText
;;;   <http://joostkremers.github.io/pandoc-mode/>
;;;=============================================================================
;; C-c C-t -- 現在書いているreST内の見出し(toc; table of contents)を表示
;; C-=, C-- C-=                       自動見出しレベル設定（C-- C-=で逆順）
;; (リージョン設定後) C-c C-c          選択範囲をコメントアウトする
;; (リージョン設定後) C-c C-r, C-c C-l インデントレベルを深くする／浅くする
;; (リージョン設定後) C-c C-e, C-c C-b すべての行を数字リスト／箇条書きにできる
;; (リージョン設定後) C-c C-d          行ブロックを設定する
;; (リージョン設定後) C-x r t          リージョン中の各行頭へ指定文字列挿入
(el-get-bundle rst-mode)
(use-package rst
  :mode (("\\.rst$"  . rst-mode)
         ("\\.rest$" . rst-mode))
  :config
  ;; 背景が黒い場合はこうしないと見出しが見づらい
  (setq frame-background-mode 'dark)
  ;; 全部スペースでインデントしましょう
  (add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))
  )
