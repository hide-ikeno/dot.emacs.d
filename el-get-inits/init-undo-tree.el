;; "C-/", "C-_": undo
;; "C-?", "M-_": redo
;; "C-x u": undo-tree-visualize
(use-package undo-tree
  :config
  ;; Replace the standard Emacs undo behavie
  (global-undo-tree-mode)
  )
