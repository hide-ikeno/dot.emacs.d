;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 45_flycheck.el
;;; Description: Customize flycheck
;;;
;;; Code:
(el-get-bundle s)
(el-get-bundle flycheck)
(el-get-bundle flycheck-pos-tip)
(el-get-bundle elpa:helm-flycheck)

;;;=============================================================================
;;; flycheck --- Modern on the fly syntax checking for GNU Emacs
;;;=============================================================================
(use-package flycheck
  :commands global-flycheck-mode
  :defines
  flycheck-keymap-prefix
  flycheck-mode-map
  :functions
  flycheck-clear
  flycheck-compile
  flycheck-describe-checker
  flycheck-first-error
  flycheck-list-errors
  flycheck-next-error
  flycheck-previous-error
  flycheck-select-checker
  :init (global-flycheck-mode)
  :config
  (use-package helm-flycheck)
  (defhydra hydra-flycheck (:color blue :hint nil :idle 0.4)
    "
                                                                    ------------
   Navigate          Show Errors                  Do                | Flycheck |
--------------------------------------------------------------------------------
   ^_p_^revious     [_l_] list errors           [_t_] toggle Flycheck
      ^^↑^^        [_e_] list errors (helm)    [_s_] select checker
    ^_f_^irst       [_d_] clear all errors      [_r_] run via compile
      ^^↓^^          ^ ^                       [_h_] describe checker
    ^_n_^ext                                    [_q_] quit
--------------------------------------------------------------------------------
      "
    ("s" flycheck-select-checker)
    ("h" flycheck-describe-checker)
    ("d" flycheck-clear)
    ("e" helm-flycheck)
    ("f" flycheck-first-error)
    ("l" flycheck-list-errors)
    ("n" flycheck-next-error :color red)
    ("p" flycheck-previous-error :color red)
    ("r" flycheck-compile)
    ("t" flycheck-mode)
    ("q" nil)
    )
  (bind-keys :map flycheck-mode-map
             (flycheck-keymap-prefix . hydra-flycheck/body))
  )

;;;=============================================================================
;;; flycheck-tip
;;;=============================================================================
(use-package flycheck-pos-tip)
