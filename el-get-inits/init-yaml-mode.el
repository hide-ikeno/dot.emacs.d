(use-package yaml-mode
  :mode (("\\.yml$"  . yaml-mode)
         ("\\.yaml$" . yaml-mode))
  :config
  (bind-keys :map yaml-mode-map
             ("C-m" . newline-and-indent))
  )
