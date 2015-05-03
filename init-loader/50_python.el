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
;;; Jedi --- Python auto-completion for Emacs
;;;=============================================================================
(el-get-bundle jedi)
(use-package jedi
  :defines
  jedi:complete-on-dot
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t) ;; optional
  )

;;;=============================================================================
;;; Jedi-Direx --- Python auto-completion for Emacs
;;;=============================================================================
(el-get-bundle jedi-direx)
(use-package jedi-direx
  :commands
  jedi-direx:setup
  jedi-direx:pop-to-buffer
  :config
  (with-eval-after-load "python"
    (bind-key "C-c x" 'jedi-direx:pop-to-buffer python-mode-map))
  (add-hook 'jedi-mode-hook 'jedi-direx:setup)
  )
