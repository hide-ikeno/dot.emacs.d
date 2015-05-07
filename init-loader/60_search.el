;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 60_search.el
;;; Description: Customize search commands, like isearch and occur.
;;;
;;; Code:

;;;=============================================================================
;;; helm-swoop --- Efficiently hopping squeezed lines powered by helm interface
;;;=============================================================================
(el-get-bundle helm-swoop)

(use-package helm-swoop
  :defines
  helm-multi-swoop-edit-save
  helm-swoop-split-with-multiple-windows
  helm-swoop-split-direction
  helm-swoop-speed-or-color
  helm-swoop-move-to-line-cycle
  helm-swoop-use-line-number-face
  helm-swoop-map
  :config
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)
  ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)
  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; From helm-swoop to helm-multi-swoop-all
  (bind-keys :map helm-swoop-map
             ("M-o" . helm-multi-swoop-all-from-helm-swoop)
             ("C-s" . swoop-action-goto-line-next)
             ("C-r" . swoop-action-goto-line-prev))

  ;; C-s -> isearch-forward
  ;; C-u C-s -> helm-swoop
  ;; C-u C-u C-s -> helm-swoop-nomigemo
  ;;   <http://rubikitch.com/2015/03/23/helm-swoop-update/>
  (defun isearch-forward-or-helm-swoop (use-helm-swoop)
    (interactive "p")
    (let (current-prefix-arg
          (helm-swoop-pre-input-function 'ignore))
      (call-interactively
       (case use-helm-swoop
         (1 'isearch-forward)
         (4 'helm-swoop)
         (16 'helm-swoop-nomigemo)))))
  (bind-key "C-s" 'isearch-forward-or-helm-swoop)
  )


;;;=============================================================================
;;; ace-jump-mode -- a quick cursor jump mode for emacs
;;;=============================================================================
(el-get-bundle ace-jump-mode)
(use-package ace-jump-mode)

;;;=============================================================================
;;; ace-window
;;;=============================================================================
(el-get-bundle ace-window)
(use-package ace-window
  ;; :defines aw-keys
  :bind ("C-x o" . ace-window)
  ;; :config
  ;; (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

;;;=============================================================================
;;; ace-isearch -- A seamless bridge between isearch and ace-jump-mode
;;;=============================================================================
(el-get-bundle ace-isearch)
(use-package ace-isearch
  :defines ace-isearch-input-idle-delay ace-isearch-use-function-from-isearch
  :commands global-ace-isearch-mode
  :init
  (global-ace-isearch-mode t)
  ;; isearch-mode から M-o で helm-swoop を起動
  (bind-key "M-o" 'helm-multi-swoop-all-from-isearch isearch-mode-map)
  :config
  (setq ace-isearch-input-idle-delay 0.5)
  ;; helm-swoop は自動的に起動しない
  (setq ace-isearch-use-function-from-isearch nil)
  )
