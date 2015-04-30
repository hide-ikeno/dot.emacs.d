;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/external-packages.el
;;; Description: Setup external packages
;;;

(el-get-bundle anzu)
(el-get-bundle dired-hacks)
(el-get-bundle recentf-ext)
(el-get-bundle rainbow-delimiters)

(el-get-bundle ddskk)
(el-get-bundle migemo)
(el-get-bundle japanese-holidays)

(el-get-bundle undo-tree)
(el-get-bundle visual-regexp)

(el-get-bundle bm)
(el-get-bundle viewer)

(el-get-bundle hydra)
(el-get-bundle dash)

(el-get-bundle switch-window)
(el-get-bundle ace-jump-mode)
(el-get-bundle ace-isearch)
(el-get-bundle wgrep)

;; --- Helm
(el-get-bundle helm)
(el-get-bundle helm-ag)
(el-get-bundle helm-descbinds)
(el-get-bundle helm-gtags)
(el-get-bundle helm-migemo)
(el-get-bundle helm-swoop)

;; ;; --- Auto complete
;; (el-get-bundle auto-complete)
;; (el-get-bundle auto-complete-yasnippet)
;; (el-get-bundle auto-complete-auctex)
;; (el-get-bundle auto-complete-clang)
;; (el-get-bundle ac-helm)


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

;; ;; --- Projectile
;; (el-get-bundle projectile)

