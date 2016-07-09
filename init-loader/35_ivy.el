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
  ivy-occur-mode-map
  :commands
  ivy-mode
  ivy-resume
  ivy-wgrep-change-to-wgrep-mode
  :config
  (setq ivy-use-virtual-buffers t
        ivy-height 15
        ivy-count-format "(%d/%d) "
        ivy-display-style 'fancy
        )
  (bind-keys :map ivy-occur-mode-map
             ("r" . ivy-wgrep-change-to-wgrep-mode)
             )
  ;; (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :init
  (ivy-mode 1)
  )

(use-package counsel
  :commands
  counsel-ag
  counsel-find-file
  counsel-git
  counsel-git-grep
  counsel-grep-or-swiper
  counsel-imenu
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
         ("C-s"     . counsel-grep-or-swiper)
         ("C-r"     . counsel-imenu)
         ("C-x l"   . counsel-locate)
         ("M-y"     . counsel-yank-pop)
         :map help-map
         ("f" . counsel-describe-function)
         ("v" . counsel-describe-variable)
         ("l" . counsel-load-library)
         )
  :config
  )

;; (use-package swiper
;;   :bind (("C-s" . swiper))
;;   )
