(use-package helm-pydoc
  :config
  (with-eval-after-load "python"
    (bind-key "C-c C-d" 'helm-pydoc python-mode-map))
  )
