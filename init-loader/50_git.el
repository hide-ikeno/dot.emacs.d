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
  :defines
  magit-completing-read-function
  magit-last-seen-setup-instructions
  :commands
  magit-status
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-last-seen-setup-instructions "1.4.0")
  (use-package ivy
    :config
    (setq magit-completing-read-function 'ivy-completing-read))
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
;;; git-timemachine --- Travel Back and Forward in Git History
;;;=============================================================================
(el-get-bundle git-timemachine)
;; Visit a git-controlled file and issue
;;   M-x git-timemachine
;; or
;;   M-x git-timemachine-toggle
;; if you just need to toggle the timemachine
;;
;; Keybinds:
;;   p: Visit previous historic version
;;   n: Visit next historic version
;;   w: Copy the abbreviated hash of the current historic version
;;   W: Copy the full hash of the current historic version
;;   g: Goto nth revision
;;   q: Exit the time machine.
;;
(use-package git-timemachine)

;;;=============================================================================
;;; helm-ls-git --- list git files using helm interactive
;;;=============================================================================
;; (el-get-bundle helm-ls-git)
;; (use-package helm-ls-git
;;   :defines helm-ls-git-fuzzy-match
;;   :bind ("C-x C-g" . helm-ls-git-ls)
;;   :config (setq helm-ls-git-fuzzy-match t)
;;   )
