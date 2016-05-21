;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 35_yivy.el
;;; Description: Customize yIvy
;;;
;;; Code:

;;;============================================================================
;;; Swiper --- Emacs isearch with an overview. Oh, man!
;;; Ivy --- Incremental Vertical completYon
;;;  <https://github.com/abo-abo/swiper>
;;;============================================================================
;; (el-get-bundle ivy)     ;; swiper uses ivy.el
;; (el-get-bundle counsel) ;; counsel uses ivy.el
(el-get-bundle swiper)  ;; swiper uses ivy.el

(use-package ivy
  :defines
  ivy-count-format
  ivy-display-style
  ivy-height
  ivy-re-builders-alist
  ivy-use-virtual-buffers
  :commands
  ivy-mode
  ivy-resume
  :config
  (setq ivy-use-virtual-buffers t
        ivy-height 15
        ivy-count-format "(%d/%d) "
        ivy-display-style 'fancy
        )
  ;; (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode 1)
  )

(use-package counsel
  :commands
  counsel-ag
  counsel-find-file
  counsel-git
  counsel-git-grep
  counsel-info-lookup-symbol
  counsel-locate
  counsel-M-x
  counsel-unicode-char
  counsel-yank-pop
  :bind (("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("<f2> i"  . counsel-info-lookup-symbol)
         ("<f2> u"  . counsel-unicode-char)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-x l"   . counsel-locate)
         ("M-y"     . counsel-yank-pop)
         :map help-map
         ("f" . counsel-describe-function)
         ("v" . counsel-describe-variable)
         ("l" . counsel-load-library)
         )
  :config
  )

(use-package swiper
  :bind (("C-s" . swiper))
  )
