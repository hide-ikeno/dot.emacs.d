;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/40_git.el
;;; Description: Setup for Git
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Magit -- control Git from Emacs
;;;=============================================================================
(el-get-bundle magit)
(use-package magit
  :defines magit-last-seen-setup-instructions
  :config
  (setq magit-last-seen-setup-instructions "1.4.0")
  )

;;;=============================================================================
;;; git-gutter, git-gutter-fringe --  Port of Sublime Text plugin GitGutter
;;;=============================================================================
(el-get-bundle git-gutter-fringe)
(use-package git-gutter-fringe
  :config
  ;; Please adjust fringe width if your own sign is too big.
  (setq-default left-fringe-width  20)
  (setq-default right-fringe-width 20)
  ;; ;; Face
  ;; (set-face-foreground 'git-gutter-fr:modified "yellow")
  ;; (set-face-foreground 'git-gutter-fr:added    "blue")
  ;; (set-face-foreground 'git-gutter-fr:deleted  "white")
  (global-git-gutter-mode))

;;;=============================================================================
;;; gist -- Emacs integration for gist.github.com
;;;=============================================================================
(el-get-bundle gist)
(use-package gist)

;;;=============================================================================
;;; helm-ls-git --- list git files using helm interactive
;;;=============================================================================
(el-get-bundle helm-ls-git)
(use-package helm-ls-git
  :bind (("C-x C-g" . helm-ls-git-ls)))
