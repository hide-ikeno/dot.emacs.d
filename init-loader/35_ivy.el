;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 35_yivy.el
;;; Description: Customize yIvy
;;;
;;; Code:

;;;============================================================================
;;; Avy ---Jump to things in Emacs tree-style
;;; https://github.com/abo-abo/avy
;;;============================================================================

(el-get-bundle avy)
(use-package avy)

;;;============================================================================
;;; Swiper --- Emacs isearch with an overview. Oh, man!
;;; Ivy --- Incremental Vertical completYon
;;; https://github.com/abo-abo/swiper
;;;============================================================================
(el-get-bundle swiper) ;; swiper uses ivy.el

(use-package ivy
  :defines
  ivy-use-virtual-buffers
  ivy-height
  ivy-count-format
  :commands
  ivy-mode
  swiper
  counsel-ag
  counsel-find-file
  counsel-git
  counsel-git-grep
  counsel-info-lookup-symbol
  counsel-locate
  counsel-M-x
  counsel-unicode-char
  :bind (("C-s"     . swiper)
         ("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ;; ([f2] i  . counsel-info-lookup-symbol)
         ;; ([f2] u  . counsel-unicode-char)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-x l"   . counsel-locate)
         )
  :config
  (setq ivy-use-virtual-buffers t
        ivy-height 15
        ivy-count-format "(%d/%d) ")
  (ivy-mode 1)
  (bind-keys :map help-map
             ("f" . counsel-describe-function)
             ("v" . counsel-describe-variable)
             ("l" . counsel-load-library))
  )
