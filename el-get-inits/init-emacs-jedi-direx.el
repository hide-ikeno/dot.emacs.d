(use-package jedi-direx
  :config
  (with-eval-after-load "python"
    (bind-key "C-c x" 'jedi-direx:pop-to-buffer python-mode-map)
    )
  (add-hook 'jedi-mode-hook 'jedi-direx:setup)
  )
