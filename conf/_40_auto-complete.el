;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/inits/60_auto-complete.el
;;; Description: Setup Auto Complete
;;;

(el-get 'sync '(auto-complete
                auto-complete-chunk
                ;; auto-complete-clang
                auto-complete-css
                auto-complete-emacs-lisp
                auto-complete-etags
                ;; auto-complete-extension
                auto-complete-latex
                auto-complete-ruby
                ac-dabbrev
                ac-math))

(use-package auto-complete-config
  :config
  (add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/ac-dict"))
  (define-key ac-mode-map  [(control tab)] 'auto-complete)
  (setq ac-delay 0.3)
  (ac-config-default)
  ;; (defun my-ac-config ()
  ;;   (setq-default ac-sources '(ac-source-abbrev
  ;;                              ac-source-dictionary
  ;;                              ac-source-words-in-same-mode-buffers))
  ;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;;   ;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  ;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  ;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
  ;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  ;;   (global-auto-complete-mode t))

  ;; (my-ac-config)
  )

(use-package ac-math)

;; (when (require 'auto-complete-config nil t)
;;   (add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/ac-dict"))
;;   (define-key ac-mode-map  [(control tab)] 'auto-complete)
;;   (setq ac-delay 0.3)

;;   ;; Emacs Clang Completion Async (clang-complete is installed in system directory)
;;   (if (require 'auto-complete-clang-async nil t)
;;       (progn
;;         ;; Change cc-mode setting
;;         (defun my-ac-cc-mode-setup ()
;;           (setq ac-clang-complete-executable "clang-complete")
;;           ;; Sources for auto-complete in cc-mode
;;           (setq ac-sources (append '(ac-source-clang-async ac-source-gtags) ac-sources))
;;           ;; Extra compilation flags to pass to the Clang executable.
;;           (setq ac-clang-flags '("-Wall" "-std=c++11" "-stdlib=libc++" "-I/usr/local/include/eigen3"))
;;           (ac-clang-launch-completion-process))
;;         )
;;     (defun my-ac-cc-mode-setup ()
;;       (setq ac-sources (append '(ac-source-gtags) ac-sources)))
;;     )

;;   (defun my-ac-config ()
;;     (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;     (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;     (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;;     (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;     (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;     (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;     (global-auto-complete-mode t))

;;   (my-ac-config)
;;   )
