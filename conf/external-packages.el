;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/external-packages.el
;;; Description: Setup external packages
;;;

(el-get-bundle anzu)
(el-get-bundle bm)
(el-get-bundle dash)
(el-get-bundle ddskk)
(el-get-bundle dired-hacks)
(el-get-bundle hydra)
(el-get-bundle japanese-holidays)
(el-get-bundle migemo)
(el-get-bundle rainbow-delimiters)
(el-get-bundle recentf-ext)
(el-get-bundle switch-window)
(el-get-bundle undo-tree)
(el-get-bundle viewer)
(el-get-bundle visual-regexp)

(el-get-bundle wrap-region)

;; --- Directory tree explore
;; (el-get-bundle popwin)
(el-get-bundle direx :depends popwin)

;; --- Helm
(el-get-bundle helm)
(el-get-bundle helm-ag)
(el-get-bundle helm-descbinds)
(el-get-bundle helm-migemo)
(el-get-bundle helm-swoop)

;; ace-jump-mode
(el-get-bundle ace-jump-mode)
(el-get-bundle ace-isearch)

;; wgrep and wgrep-helm
(el-get-bundle wgrep)

;; Multiple cursors
(el-get-bundle multiple-cursors)
(el-get-bundle expand-region)
(el-get-bundle region-bindings-mode
  :depends (multiple-cursors expand-region))

;; Incremental search compatible with multiple-cursors
;; (el-get-bundle phi-search)
;; (el-get-bundle phi-search-dired)
;; (el-get-bundle zk-phi/phi-search-migemo
;;   :depends (phi-search migemo))

;; --- Programing language mode
(el-get-bundle yaml-mode)
(el-get-bundle toml-mode)
(el-get-bundle json-mode)
(el-get-bundle cmake-mode)

(el-get-bundle markdown-mode)
(el-get-bundle rst-mode)
(el-get-bundle pandoc-mode)

;; --- flycheck
(el-get-bundle flycheck)
(el-get-bundle flycheck-pos-tip)
(el-get-bundle yasuyk/helm-flycheck)

;; --- Git
(el-get-bundle magit)
(el-get-bundle gist)
(el-get-bundle git-gutter-fringe+)

;; -- Yasnippets
(el-get-bundle yasnippet)

;; -- TAG jump by using gtags
(el-get-bundle ggtags)
(el-get-bundle helm-gtags)

;; --- Company mode
(el-get-bundle company)
(el-get-bundle company-c-headers)

;; AucTeX
(el-get-bundle auctex)
(el-get-bundle company-auctex)

;; C++ development environment

;; (el-get-bundle irony-mode)
;; (el-get-bundle company-irony)
;; (el-get-bundle flycheck-irony)

;; Python development environment
(el-get-bundle jedi)
(el-get-bundle syohex/emacs-company-jedi
  :depends (company jedi))
(el-get-bundle tkf/emacs-jedi-direx
  :depends (jedi direx))
(el-get-bundle helm-pydoc)

;; Rust
(el-get-bundle rust-mode)

;; Uncrustify -- emacs front end of uncrustify code formatter
(el-get-bundle glima/Emacs-uncrustify
  :name uncrustify)

;; Guide-key
(el-get-bundle guide-key)
