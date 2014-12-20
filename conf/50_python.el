;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_python.el
;;; Description: Python major mode
;;;
;;; Code:
;;;

;; external package
(el-get 'sync '(anaconda-mode company-anaconda))

;;;=============================================================================
;;; Use IPython as python interpreter
;;;=============================================================================

;; IPython
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args ""
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code
        "from IPython.core.completerlib import module_completion"
        python-shell-completion-module-string-code
        "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code
        "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  )

;;;=============================================================================
;;; Use IPython as python interpreter
;;;=============================================================================
;; M-.  anaconda-mode-goto-definitions
;; M-*  anaconda-nav-pop-marker
;; M-?  anaconda-mode-view-doc
;; M-r  anaconda-mode-usages
(use-package anaconda
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'eldoc-mode)
  )

;;;=============================================================================
;;; company-anaconda -- Anaconda backend for company-mode.
;;;=============================================================================

(use-package company-anaconda
  :config
  (add-to-list 'company-backends 'company-anaconda)
  )
