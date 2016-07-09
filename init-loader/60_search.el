;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; file: 60_search.el
;;; Description: Customize search commands, like isearch and occur.
;;;
;;; Code:

;;;=============================================================================
;;; Avy -- Jump to things in Emacs tree-style
;;;   <https://github.com/abo-abo/avy>
;;;=============================================================================
(el-get-bundle avy)

(use-package avy
  :demand
  :defines
  avy-background
  :commands
  avy-goto-char
  avy-goto-char-2
  avy-goto-word-1
  add-keys-to-avy
  :config
  ;; Darken background
  (setq avy-background t)
  ;;
  ;; avy version of one-step activation
  ;; http://d.hatena.ne.jp/rkworks/20120520/1337528737
  (defun add-keys-to-avy (prefix c &optional mode)
    (define-key global-map
      (read-kbd-macro (concat prefix (string c)))
      `(lambda ()
         (interactive)
         (funcall (if (eq ',mode 'word)
                      #'avy-goto-word-1
                    #'avy-goto-char) ,c))))
  ;;
  ;; Assing key bindings for all characters
  ;; eg, A-s-x will activate (avy-goto-char ?x), ie, all occurrence of x
  (loop for c from ?! to ?~ do (add-keys-to-avy "M-s-" c))
  ;; eg, M-s-x will activate (avy-goto-word-1 ?x), ie, all words starting with x
  (loop for c from ?! to ?~ do (add-keys-to-avy "M-s-S-" c 'word))
  )
