;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/70_helm.el
;;; Description: Setup helm
;;;

(el-get 'sync '(helm
                helm-ag
                helm-c-yasnippet
                helm-company
                helm-descbinds
                helm-gist
                ;; ggtags
                helm-gtags
                helm-ls-git
                helm-swoop
                helm-migemo))

;;;=============================================================================
;;; helm --- Emacs incremental and narrowing framework
;;;=============================================================================
(use-package helm-config
  :config
  (setq helm-idle-delay 0.1)
  (setq helm-input-idle-delay 0)
  (setq helm-candidate-number-limit 300)
  (setq helm-samewindow nil)
  (setq helm-quick-update t)
  ;; Change face for dark color theme
  (set-face-background 'helm-selection "blue")
  ;; Keybindings
  (defun helm-my-buffers ()
    (interactive)
    (helm-other-buffer '(helm-source-buffers-list
                         helm-source-files-in-current-dir
                         helm-source-recentf
                         helm-source-buffer-not-found)
                       "*helm-my-buffers*"))

  (bind-keys :map helm-map
             ("C-M-n" . helm-next-source)
             ("C-M-p" . helm-previous-source))
  (helm-mode 1)

  :bind (("C-;"     . helm-my-buffers)
         ("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-M-z"   . helm-resume)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-c i"   . helm-imenu))
  )

;;;=============================================================================
;;; helm-ag.el --- the silver searcher with helm interface
;;;=============================================================================
(use-package helm-ag)

;;;=============================================================================
;;; wgrep-helm --- helm interface for wgrep (bundled in wgrep)
;;;=============================================================================
(use-package wgrep-helm)

;;;=============================================================================
;;; helm-descbinds.el --- Yet Another `describe-bindings' with `helm'.
;;;=============================================================================
(use-package helm-descbinds
  :config  (helm-descbinds-mode))

;;;=============================================================================
;;; helm-ls-git --- list git files using helm interactive
;;;=============================================================================
(use-package helm-ls-git
  :bind (("C-x C-g" . helm-ls-git-ls)))

;;;=============================================================================
;;; helm-c-yasnippet --- helm sources for yasnippet
;;;=============================================================================
(use-package helm-c-yasnippet
  :config
  (setq helm-c-yas-space-match-any-greedy t) ;; [default: nil]
  ;; (global-set-key (kbd "C-c y") 'helm-c-yas-complete)
  (bind-keys :map yas-minor-mode-map
             ("C-c y" . helm-c-yas-complete))
  )

;;;=============================================================================
;;; ggtags --- Emacs frontend to GNU Global source code tagging system
;;;            This package is utilized in conjunction with helm-gtags
;;;=============================================================================
;; (use-package ggtags
;;   :config
;;   (add-hook 'c-mode-common-hook
;;             (lambda ()
;;               (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;                 (ggtags-mode 1))))
;;   ;; Add keybinds
;;   (bind-keys :map ggtags-mode-map
;;              ("C-c g s" . ggtags-find-other-symbol)
;;              ("C-c g h" . ggtags-view-tag-history)
;;              ("C-c g r" . ggtags-find-reference)
;;              ("C-c g f" . ggtags-find-file)
;;              ("C-c g c" . ggtags-create-tags)
;;              ("C-c g u" . ggtags-update-tags)
;;              ;; ("M-,"     . 'pop-tag-mark))
;;   ))

;;;=============================================================================
;;; helm-gtags --- helm interface for gtags
;;;=============================================================================
(use-package helm-gtags
  :config
  (setq helm-gtags-ignore-case t
        helm-gtags-auto-update t
        helm-gtags-use-input-at-cursor t
        helm-gtags-pulse-at-cursor t
        helm-gtags-prefix-key "\C-cg"
        helm-gtags-suggested-key-mapping t)
  ;; Enable helm-gtags mode
  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  ;; Add keybinds
  (bind-keys :map helm-gtags-mode-map
             ("C-c g a" . helm-gtags-tags-in-this-function)
             ("M-s"     . helm-gtags-select)
             ("M-."     . helm-gtags-dwim)
             ("M-,"     . helm-gtags-pop-stack)
             ("C-c <"   . helm-gtags-previous-history)
             ("C-c >"   . helm-gtags-next-history))
  )


;;;=============================================================================
;;; helm-company --- Helm interface for company-mode
;;;=============================================================================
(use-package helm-company
  :config
  (bind-keys :map company-mode-map   ("C-:" . helm-company))
  (bind-keys :map company-active-map ("C-:" . helm-company))
  )

;; ;; helm-migemo
;; (when (require 'helm-migemo nil t)
;;   (setq helm-use-migemo t)
;;   )

;; ;; helm-project
;; (when  (require 'helm-project nil t)
;;    (global-set-key (kbd "C-c C-f") 'helm-project))

;;;=============================================================================
;;; helm-swoop --- Efficiently hopping squeezed lines powered by helm interface
;;;=============================================================================
(use-package helm-swoop
  :config
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)
  ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)
  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; When doing isearch, hand the word over to helm-swoop
  (bind-keys :map isearch-mode-map
             ("M-i" . helm-swoop-from-isearch))
  ;; From helm-swoop to helm-multi-swoop-all
  (bind-keys :map helm-swoop-map
             ("M-i" . helm-multi-swoop-all-from-helm-swoop)
             ("C-s" . swoop-action-goto-line-next)
             ("C-r" . swoop-action-goto-line-prev))
  )
