(use-package helm
  :config
  (use-package helm-config)
  (setq helm-idle-delay 0.1)
  (setq helm-input-idle-delay 0)
  (setq helm-candidate-number-limit 300)
  (setq helm-samewindow nil)
  (setq helm-quick-update t)
  ;; Change face for dark color theme
  (set-face-background 'helm-selection "blue")
  ;; Keybindings
  (defun helm-my-buffers ()
    (interactive)
    (helm-other-buffer '(helm-source-buffers-list
                         helm-source-files-in-current-dir
                         helm-source-recentf
                         helm-source-buffer-not-found)
                       "*helm-my-buffers*"))

  (bind-keys :map helm-map
             ("C-M-n" . helm-next-source)
             ("C-M-p" . helm-previous-source))
  (helm-mode 1)

  :bind (("C-;"     . helm-my-buffers)
         ("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-M-z"   . helm-resume)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ;; ("C-c i"   . helm-imenu)
         ("M-/"     . helm-dabbrev)
         )
  )

