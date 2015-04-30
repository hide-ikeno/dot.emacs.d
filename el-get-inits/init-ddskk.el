(use-package skk-autoloads
  :bind (("C-x C-j" . skk-mode)
         ("C-x j" . skk-auto-fill-mode))
  ;;(global-set-key "\C-xt" 'skk-tutorial)
  :defines skk-init-file skk-isearch-start-mode
  :config
  (use-package skk-leim)
  (setq default-input-method 'japanese-skk)
  (setq skk-init-file (locate-user-emacs-file ".skk"))
  (add-hook 'isearch-mode-hook
            (lambda () (and (boundp 'skk-mode) skk-mode
                            (skk-isearch-mode-setup))))
  (add-hook 'isearch-mode-end-hook
            (lambda ()
              (and (featurep 'skk-isearch) (skk-isearch-mode-cleanup))))
  (setq skk-isearch-start-mode 'latin)
  )
