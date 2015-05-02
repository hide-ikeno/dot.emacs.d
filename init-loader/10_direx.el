;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/10_direx.el
;;; Description: Setup direx mode
;;;

;;;=============================================================================
;;; direx -- Simple Directory Explorer
;;;=============================================================================
(el-get-bundle direx)

(use-package direx-project
  :config
  ;; project 内にいるなら direx-project を起動する．そうでなければ普通に direx を
  ;; 起動する．
  (defun my-direx-jump-to-directory ()
    (interactive)
    (let ((result (ignore-errors
                    (direx-project:jump-to-project-root-other-window)
                    t)))
      (unless result
        (direx:jump-to-directory-other-window))))
  (bind-key "C-x C-j" 'my-direx-jump-to-directory)
  (use-package popwin
    :config
    (push '(direx:direx-mode :position left :width 40 :dedicated t)
          popwin:special-display-config))
  )
