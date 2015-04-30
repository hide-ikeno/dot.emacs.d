(use-package recentf-ext
  :config
  (setq recentf-save-file (expand-file-name (locate-user-emacs-file ".recentf"))
)
  (setq recentf-max-saved-items 2000)
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  )
