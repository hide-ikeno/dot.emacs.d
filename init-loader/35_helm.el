;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/70_helm.el
;;; Description: Setup helm
;;;

;;;=============================================================================
;;; helm --- Emacs incremental and narrowing framework
;;;=============================================================================
(el-get-bundle helm)
(el-get-bundle helm-descbinds)
(el-get-bundle helm-ls-git)
(el-get-bundle helm-migemo)
(el-get-bundle helm-swoop)
(el-get-bundle ac-helm)

(use-package helm-config
  :defines
  helm-idle-delay
  helm-input-idle-delay
  helm-candidate-number-limit
  helm-samewindow
  helm-quick-update
  helm-map
  :init (helm-mode 1)
  :commands
  helm-other-buffer
  helm-mode
  helm-for-files
  helm-candidates-in-buffer
  helm-get-current-source
  helm-aif
  :config
  (use-package helm-files)
  (setq helm-idle-delay 0.1)
  (setq helm-input-idle-delay 0)
  (setq helm-candidate-number-limit 300)
  (setq helm-samewindow nil)
  (setq helm-quick-update t)
  ;; Change face for dark color theme
  ;; (set-face-background 'helm-selection "blue")
  ;;
  ;; helm-descbinds.el --- Yet Another `describe-bindings' with `helm'.
  ;;
  (use-package helm-descbinds
    :commands helm-descbinds-mode
    :config (helm-descbinds-mode)
    )

  ;;
  ;; helm-migemo
  ;;

  (use-package helm-migemo
    :defines
    helm-migemize-command-idle-delay
    helm-for-files
    :commands
    helm-migemize-command
    :init
    (helm-migemize-command helm-for-files)
    :config
    (defun helm-compile-source--candidates-in-buffer (source)
      (helm-aif (assoc 'candidates-in-buffer source)
          (append source
                  `((candidates
                     . ,(or (cdr it)
                            (lambda ()
                              ;; Do not use `source' because other plugins
                              ;; (such as helm-migemo) may change it
                              (helm-candidates-in-buffer (helm-get-current-source)))))
                    (volatile) (match identity)))
        source))
    ;; helmコマンドで migemo を有効にする
    (setq helm-migemize-command-idle-delay helm-idle-delay)
    )
  ;;
  ;; helm-swoop
  ;;
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

    ;; When doing isearch, hand the word over to helm-swoop
    (bind-keys :map isearch-mode-map
               ("M-i" . helm-swoop-from-isearch))
    ;; From helm-swoop to helm-multi-swoop-all
    (bind-keys :map helm-swoop-map
               ("M-i" . helm-multi-swoop-all-from-helm-swoop)
               ("C-s" . swoop-action-goto-line-next)
               ("C-r" . swoop-action-goto-line-prev))
    )
  ;;
  ;; ac-helm --- helm source for auto-complete
  ;;
  (use-package ac-helm
    :bind ("C-:" . ac-complete-with-helm)
    :config
    (bind-key "C-;" 'ac-complete-with-helm ac-complete-mode-map)
    )
  ;;
  ;; Keybindings
  ;;
  (defun my-helm-switch-to-buffer ()
    (interactive)
    (helm-other-buffer '(helm-source-buffers-list
                         helm-source-recentf
                         helm-source-files-in-current-dir
                         helm-source-ls-git
                         helm-source-session
                         helm-source-buffer-not-found)
                       "*helm-my-buffers*"))

  ;; source 間の移動
  (bind-keys :map helm-map
             ("C-M-n" . helm-next-source)
             ("C-M-p" . helm-previous-source))

  :bind (("C-;"     . helm-mini)
         ("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-M-z"   . helm-resume)
         ;; ("C-x C-f" . helm-find-files)
         ("C-x b"   . my-helm-switch-to-buffer)
         ("C-x C-b" . helm-buffers-list)
         ("C-c i"   . helm-imenu))
  )


;; ;;;=============================================================================
;; ;;; helm-company --- Helm interface for company-mode
;; ;;;=============================================================================
;; (use-package helm-company
;;   :config
;;   (bind-keys :map company-mode-map   ("C-:" . helm-company))
;;   (bind-keys :map company-active-map ("C-:" . helm-company))
;;   )
