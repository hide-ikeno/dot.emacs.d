;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/inits/60_auto-complete.el
;;; Description: Setup Auto Complete
;;;

(use-package auto-complete-config
  :config
  (bind-keys :map ac-mode-map
             ([(control tab)] . 'auto-complete))
  (add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/ac-dict"))
  (setq ac-delay 0.3)

  (defun my-ac-config ()
    (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
    (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
    ;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
    (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
    (add-hook 'css-mode-hook 'ac-css-mode-setup)
    (add-hook 'auto-complete-mode-hook 'ac-common-setup)
    (global-auto-complete-mode t))

  (my-ac-config)
  )

;;;
;;; Emacs Clang Completion Async (clang-complete is installed in system directory)
;;;
(use-package auto-complete-clang-async
  :config
  (defun my-ac-cc-mode-setup ()
    (setq ac-clang-complete-executable "clang-complete")
    ;; Sources for auto-complete in cc-mode
    (add-to-list 'ac-sources 'ac-source-clang-async)
    (add-to-list 'ac-sources 'ac-source-gtags)
    ;; Extra compilation flags to pass to the Clang executable.
    (setq ac-clang-flags '("-Wall" "-std=c++11" "-stdlib=libc++" "-I/usr/local/include/eigen3"))
    (ac-clang-launch-completion-process))
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  )

;; Auto Complete source for python
(use-package ac-python)
