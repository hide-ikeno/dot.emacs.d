(use-package yasnippet
  :config
  (setq yas-snippet-dirs
        ;; Location of private snippets
        '("~/.emacs.d/local/yasnippet/snippets"
          ;; Location of default snippets
          "~/.emacs.d/el-get/yasnippet/snippets"))
  (yas-global-mode 1)
  (custom-set-variables '(yas-trigger-key "TAB"))
  )
