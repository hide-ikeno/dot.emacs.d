;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 50_python.el
;;; Description: Python major mode
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Use IPython as python interpreter
;;;=============================================================================

;; IPython
;; TODO: python-shell-completion-string-code is obsolete
(use-package python
  :defines
  python-shell-interpreter
  python-shell-interpreter-args
  python-shell-prompt-regexp
  python-shell-prompt-output-regexp
  python-shell-completion-setup-code
  ;; python-shell-completion-module-string-code
  python-shell-completion-string-code
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args ""
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code
        "from IPython.core.completerlib import module_completion"
        ;; python-shell-completion-module-string-code
        ;; "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code
        "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  )

;;;=============================================================================
;;; pyenv-mode
;;;=============================================================================
(el-get-bundle pythonic)
(el-get-bundle pyenv-mode)
(use-package pyenv-mode
  :config
  (pyenv-mode))

;; ;;;=============================================================================
;; ;;; Anaconda mode -- Code navigation, documentation lookup and completion for
;; ;;; Python.
;; ;;;=============================================================================
;; (el-get-bundle anaconda-mode)
;; (el-get-bundle company-anaconda)

;; (use-package anaconda-mode
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'eldoc-mode)
;;   )

;; (use-package company-anaconda
;;   :config
;;   (add-to-list 'company-backends 'company-anaconda)
;;   )
