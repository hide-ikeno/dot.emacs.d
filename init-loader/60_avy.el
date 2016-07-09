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
(el-get-bundle elpa:avy)
(use-package avy
  :defines
  avy-background
  :commands
  avy-goto-line
  :bind (("M-g f" . avy-goto-line))
  :config
  ;; Darken background
  (setq avy-background t)
  )

;;;=============================================================================
;;; zzz-to-char --- Fancy replacement for zap-to-char in Emacs
;;;    <https://github.com/mrkkrp/zzz-to-char>
;;;=============================================================================
(el-get-bundle elpa:zzz-to-char)
(use-package zzz-to-char
  :defines
  zzz-to-char-reach
  :commands
  zzz-to-char
  :bind (("M-z" . zzz-to-char))
  :config
  (setq zzz-to-char-reach 80)
  )

;;;=============================================================================
;;; Avy-migemo -- Avy with migemo
;;;   <https://github.com/momomo5717/avy-migemo>
;;;=============================================================================
(el-get-bundle elpa:avy-migemo)

(use-package avy-migemo
  :commands
  avy-migemo-mode
  avy-migemo-goto-char-timer
  avy-migemo-goto-word-1
  :bind (("C-'"  . avy-migemo-goto-char-timer)
         ("M-g w"  . avy-migemo-goto-word-1)
         )
  :init
  (avy-migemo-mode 1)
  )

(use-package avy-migemo-e.g.swiper)
(use-package avy-migemo-e.g.ivy)
(use-package avy-migemo-e.g.counsel)
(use-package avy-migemo-e.g.zzz-to-char)
