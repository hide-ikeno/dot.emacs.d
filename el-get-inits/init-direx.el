;; direx is required by direx-project
(use-package direx-project
  :config
  ;; project内にいるなら，direx-projectを起動する．そうでなければ普通にdirexを起
  ;; 動する．
  (defun direx:jump-to-project-directory ()
    (interactive)
    (let ((result (ignore-errors
                    (direx-project:jump-to-project-root-other-window)
                    t)))
      (unless result
        (direx:jump-to-directory-other-window))))
  (push '(direx:direx-mode :position left :width 25 :dedicated t)
		popwin:special-display-config)
  (bind-key "C-x C-j" 'direx:jump-to-project-directory)
  )
