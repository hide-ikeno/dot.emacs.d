;;;-*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 50_gtags.el
;;; Description: Customize gtags
;;;
;;; Code:
;;;


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
(el-get-bundle helm-gtags)
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


