;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 35_yivy.el
;;; Description: Customize yIvy
;;;
;;; Code:

;;;============================================================================
;;; Swiper --- Emacs isearch with an overview. Oh, man!
;;; Ivy --- Incremental Vertical completYon
;;; https://github.com/abo-abo/swiper
;;;============================================================================
(el-get-bundle swiper) ;; swiper uses ivy.el
(el-get-bundle avy-migemo)

(use-package ivy
  :defines
  ivy-count-format
  ivy-display-style
  ivy-height
  ivy-re-builders-alist
  ivy-use-virtual-buffers
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
  counsel-yank-pop
  :bind (("C-s"     . swiper)
         ("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("<f2> i"  . counsel-info-lookup-symbol)
         ("<f2> u"  . counsel-unicode-char)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-x l"   . counsel-locate)
         ("M-y"     . counsel-yank-pop)
         )
  :config
  (use-package avy-migemo-e.g.swiper)
  (use-package avy-migemo-e.g.counsel)
  (setq ivy-use-virtual-buffers t
        ivy-height 15
        ivy-count-format "(%d/%d) "
        ivy-display-style 'fancy
        )
  ;; (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode 1)
  (bind-keys :map help-map
             ("f" . counsel-describe-v)
             ("v" . counsel-describe-variable)
             ("l" . counsel-load-library))
  )


(use-package avy-migemo
  :demand
  :commands
  add-keys-to-avy
  avy-migemo-goto-char
  avy-migemo-goto-char-2
  avy-migemo-goto-word-1
  avy-migemo-mode
  :defines
  avy-background
  :config
  ;; Darken background
  (setq avy-background t)
  (avy-migemo-mode 1)
  ;;
  ;; avy-migemo version of one-step activation
  ;;
  ;; http://d.hatena.ne.jp/rkworks/20120520/1337528737
  ;; http://qiita.com/kaz-yos/items/458630d7bb32f8d32163
  (defun add-keys-to-avy (prefix c &optional mode)
    (define-key global-map
      (read-kbd-macro (concat prefix (string c)))
      `(lambda ()
         (interactive)
         (funcall (if (eq ',mode 'word)
                      #'avy-migemo-goto-word-1
                    #'avy-migemo-goto-char) ,c))))
  ;;
  ;; Assing key bindings for all characters
  ;; eg, A-s-x will activate (avy-goto-char ?x), ie, all occurrence of x
  (loop for c from ?! to ?~ do (add-keys-to-avy "A-s-" c))
  ;; eg, M-s-x will activate (avy-goto-word-1 ?x), ie, all words starting with x
  (loop for c from ?! to ?~ do (add-keys-to-avy "M-s-" c 'word))
  )

