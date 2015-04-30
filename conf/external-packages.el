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

;; --- Directory tree explore
(el-get-bundle popwin)
(el-get-bundle direx)

;; --- Helm
(el-get-bundle helm)
(el-get-bundle helm-ag)
(el-get-bundle helm-descbinds)
(el-get-bundle helm-migemo)
(el-get-bundle helm-swoop)

(el-get-bundle ace-jump-mode)
(el-get-bundle ace-isearch)
(el-get-bundle wgrep)

;; --- Programing language mode
(el-get-bundle yaml-mode)
(el-get-bundle toml-mode)
(el-get-bundle json-mode)
(el-get-bundle cmake-mode)

(el-get-bundle markdown-mode)
(el-get-bundle rst-mode)
(el-get-bundle pandoc-mode)

(el-get-bundle rust-mode)

;; --- flycheck
(el-get-bundle flycheck)
(el-get-bundle yasuyk/helm-flycheck)

;; --- Git
(el-get-bundle magit)
(el-get-bundle gist)
(el-get-bundle git-gutter-fringe+)

;; -- Doxymacs
;; Compile error
;; (el-get-bundle doxymacs)
;; (el-get-bundle doxy-preview)

;; -- Yasnippets
(el-get-bundle yasnippet)

;; -- TAG jump by using gtags
(el-get-bundle ggtags)
(el-get-bundle helm-gtags)

;; --- Company mode
(el-get-bundle company)
(el-get-bundle company-c-headers)

;; --- Irony-mode
(el-get-bundle irony-mode)
(el-get-bundle company-irony)
(el-get-bundle flycheck-irony)

;; -- AucTeX
(el-get-bundle auctex)
(el-get-bundle company-auctex)

;; --- Jedi
(el-get-bundle jedi)
(el-get-bundle syohex/emacs-company-jedi
  :depends (company jedi))
(el-get-bundle tkf/emacs-jedi-direx
  :depends (jedi direx))

;; --- Uncrustify
(el-get-bundle glima/Emacs-uncrustify
  :name uncrustify)

