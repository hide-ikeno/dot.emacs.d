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
(el-get-bundle ac-helm)


(use-package tramp
  :config
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )
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
  helm-migemo-mode
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
  (helm-migemo-mode 1)
  ;; ;;
  ;; ;; ac-helm --- helm source for auto-complete
  ;; ;;
  ;; (use-package ac-helm
  ;;   :bind ("M-/" . ac-complete-with-helm)
  ;;   :config
  ;;   (bind-key "C-;" 'ac-complete-with-helm ac-complete-mode-map)
  ;;   )
  ;;
  ;; Keybindings
  ;;
  ;; source 間の移動
  (bind-keys :map helm-map
             ("C-M-n" . helm-next-source)
             ("C-M-p" . helm-previous-source))

  :bind (("C-;"     . helm-mini)
         ("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-M-z"   . helm-resume)
         ("M-/"     . helm-dabbrev)
         ("C-x C-f" . helm-find-files)
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
