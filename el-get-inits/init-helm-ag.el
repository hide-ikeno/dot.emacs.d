(use-package helm-ag
  ;; C-M-g -> helm-ag
  ;; C-M-k -> backward-kill-sexp (remap)
  :bind (("C-M-g" . helm-ag)
         ("C-M-k" . backward-kill-sexp))
  :config
  ;; 現在のシンボルをデフォルトのクエリにする
  (setq helm-ag-insert-at-point 'symbol)
  ;; (defun helm-ag-dot-emacs ()
  ;;    ".emacs.d以下を検索"
  ;;    (interactive)
  ;;    (helm-ag "~/.emacs.d/"))
  ;; (require 'projectile nil t)
  ;; (defun helm-projectile-ag ()
  ;;    "Projectileと連携"
  ;;    (interactive)
  ;;    (helm-ag (projectile-project-root)))
  ;; (helm-ag "~/.emacs.d/"))
  )
