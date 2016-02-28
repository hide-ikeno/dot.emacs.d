;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 30_company-mode.el
;;; Description: Setup Auto Complete mode
;;;
;;;=============================================================================
;;; Auto Complete -- An Intelligent auto-completion extension for Emacs
;;;   <http://company-mode.github.io/>
;;;=============================================================================
(el-get-bundle company)

(use-package company
  :defines
  company-active-map
  company-idle-delay
  company-minimum-prefix-length
  company-selection-wrap-around
  :commands
  global-company-mode
  company-show-doc-buffer
  :init
  (global-company-mode) ;; Turn on company-mode
  :config
  (setq company-idle-delay 0.2          ; default 0.5
        company-minimum-prefix-length 4 ; default 4
        company-selection-wrap-around t ; wrap-around candidates
        )
  ;; company-active-map
  ;; M-n     次の候補選択
  ;; M-p     前の候補選択
  ;; C-g     候補選択中止
  ;; RET     候補選択
  ;; C-w     定義場所を表示
  ;; C-s     候補検索
  ;; C-M-s   候補フィルタリング
  ;; [tab]   共通するprefixを挿入
  (bind-keys :map company-active-map
             ;; M-? :  doc を別バッファに表示
             ("M-?" . company-show-doc-buffer))
  )


;;;=============================================================================
;;; company-math --- Completion back-ends for for math unicode symbols and latex
;;; tags
;;;=============================================================================
(el-get-bundle company-math)
(use-package company-math
  :config
  ;; global activation of the unicode symbol completion
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  )
