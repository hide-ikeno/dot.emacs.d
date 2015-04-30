(use-package helm-swoop
  :config
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)
  ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)
  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; When doing isearch, hand the word over to helm-swoop
  (bind-keys :map isearch-mode-map
             ("M-i" . helm-swoop-from-isearch))
  ;; From helm-swoop to helm-multi-swoop-all
  (bind-keys :map helm-swoop-map
             ("M-i" . helm-multi-swoop-all-from-helm-swoop)
             ("C-s" . swoop-action-goto-line-next)
             ("C-r" . swoop-action-goto-line-prev))
  )
