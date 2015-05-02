;; direx is required by direx-project
(use-package direx-project
  :config
  ;; project内にいるなら，direx-projectを起動する．そうでなければ普通にdirexを起
  ;; 動する．
  (defun my-direx-jump-to-directory ()
    (interactive)
    (let ((result (ignore-errors
                    (direx-project:jump-to-project-root-other-window)
                    t)))
      (unless result
        (direx:jump-to-directory-other-window))))
  (bind-key "C-x C-j" 'my-direx-jump-to-directory)
  (use-package popwin
	:config
	(push '(direx:direx-mode :position left :width 40 :dedicated t)
		  popwin:special-display-config)
	)
  )
