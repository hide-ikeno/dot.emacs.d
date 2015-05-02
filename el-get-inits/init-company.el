(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  ;; Source code completion by Clang for C/C++
  (setq company-backends (delete 'company-semantic company-backends))
  (bind-key "TAB" 'company-complete c-mode-map)
  (bind-key "TAB" 'company-complete c++-mode-map)
  )
