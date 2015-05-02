(use-package phi-search-migemo
  :config
  (bind-keys :map multiple-cursors-mode
             ("C-s" phi-migemo-search)
             ("C-r" phi-search-migemo-backward))
  )
