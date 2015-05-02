(use-package region-bindings-mode
  :config
  (region-bindings-mode-enable)
  (use-package multiple-cursors
    :config
    (bind-keys :map region-bindings-mode-map
               ("a" . mc/mark-all-like-this)
               ("p" . mc/mark-previous-like-this)
               ("n" . mc/mark-next-like-this)
               ("m" . mc/mark-more-like-this-extended))
    )
  (use-package expand-region
    :config
    (bind-keys :map region-bindings-mode-map
               ("C-=" . er/expand-region))
    )
  )
