;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 40_multiple-cursors.el
;;; Description: Setup multiple-cursors and related packages
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Expand region
;;;=============================================================================
(el-get-bundle expand-region)
(use-package expand-region
  :commands
  er/expand-region
  er/contract-region
  :bind (("C-=" . er/expand-region)
         ("C--" . er/contract-region))
  )

;;;=============================================================================
;;; Multiple Cursors
;;;=============================================================================
(el-get-bundle multiple-cursors)
(use-package multiple-cursors
  :commands
  mc/edit-lines
  mc/mark-all-dwim
  mc/mark-next-like-this
  mc/skip-to-next-like-this
  mc/unmark-next-like-this
  mc/mark-previous-like-this
  mc/skip-to-previous-like-this
  mc/unmark-previous-like-this
  mc/mark-all-in-region-regexp
  :config
  (use-package expand-region)
  (defhydra hydra-multiple-cursors (:hint nil)
    "
     ^Up^            ^Down^        ^Other^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all DWIM
[_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
[_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-dwim)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("r" mc/mark-all-in-region-regexp :exit t)
  ("q" nil))
  :bind ("<C-return>" . hydra-multiple-cursors/body))

(use-package multiple-cursors-core)

;;;=============================================================================
;;; region-bindings-mode
;;;=============================================================================
;; (el-get-bundle region-bindings-mode)
;; (use-package region-bindings-mode
;;   :defines region-bindings-mode-map
;;   :commands region-bindings-mode-enable
;;   :config
;;   ;; Multiple cursors keybindings
;;   (bind-keys :map region-bindings-mode-map
;;              ("a" . mc/mark-all-like-this-dwim)
;;              ("p" . mc/mark-previous-like-this)
;;              ("n" . mc/mark-next-like-this)
;;              ("m" . mc/mark-more-like-this-extended)
;;              ;; ("TAB"   . mc/cycle-forward)
;;              ;; ("S-TAB" . mc/cycle-backward)
;;              )
;;   (region-bindings-mode-enable)
;;   )
