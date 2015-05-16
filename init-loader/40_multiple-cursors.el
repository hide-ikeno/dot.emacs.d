;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 40_multiple-cursors.el
;;; Description: Setup multiple-cursors and related packages
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Multiple Cursors
;;;=============================================================================
(el-get-bundle multiple-cursors)
(use-package multiple-cursors
  :bind ("<C-return>" . mc/edit-lines))
(use-package multiple-cursors-core)

;;;=============================================================================
;;; region-bindings-mode
;;;=============================================================================
(el-get-bundle region-bindings-mode)
(use-package region-bindings-mode
  :defines region-bindings-mode-map
  :commands region-bindings-mode-enable
  :config
  ;; Multiple cursors keybindings
  (bind-keys :map region-bindings-mode-map
             ("a" . mc/mark-all-like-this-dwim)
             ("p" . mc/mark-previous-like-this)
             ("n" . mc/mark-next-like-this)
             ("m" . mc/mark-more-like-this-extended)
             ;; ("TAB"   . mc/cycle-forward)
             ;; ("S-TAB" . mc/cycle-backward)
             )
  (region-bindings-mode-enable)
  )
;;;=============================================================================
;;; Expand region
;;;=============================================================================
(el-get-bundle expand-region)
(use-package expand-region
  :bind (("C-=" . er/expand-region)
         ("C--" . er/contract-region))
  :init
  (bind-keys :map region-bindings-mode-map
             ("C-=" . er/expand-region)
             ("C--" . er/contract-region))
  )
