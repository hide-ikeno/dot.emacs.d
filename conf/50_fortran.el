;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_fortran.el
;;; Description: Customize Fortran major mode
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Fortran
;;;=============================================================================

;; fortran-mode
(add-hook 'fortran-mode-hook
          (lambda ()
            ;; インデントの変更
            (setq fortran-continuation-indent 4
                  fortran-structure-indent 2
                  fortran-do-indent 2
                  fortran-if-indent 2)
            (fortran-auto-fill-mode 1) ;; wrap lines in 72 columns
            ))

;; f90-mode
(add-hook 'f90-mode-hook
          (lambda ()
            (setq
             ;; キーワードの最初の1文字を大文字で
             f90-auto-keyword-case 'downcase-word
             ;; 継続行の最初に"&"を追加
             f90-beginning-ampersand t
             ;; インデントの変更
             f90-continuation-indent 4
             f90-do-indent 2
             f90-if-indent 2
             f90-type-indent 2
             f90-program-indent 2
             f90-leave-line-no nil)
            (setq comment-column 35)
            ))
