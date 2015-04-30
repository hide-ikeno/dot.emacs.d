(use-package bm
  :init
  (require 'view)
  :config
  ;; Add some key-binds in view-mode
  (bind-keys :map view-mode-map
             ("m" . bm-toggle)
             ("[" . bm-previous)
             ("]" . bm-next))
  )

