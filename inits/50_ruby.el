;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_ruby.el
;;; Description: Customize Ruby major mode
;;;
;;; Code:
;;;

;;;=============================================================================
;;; Fortran
;;;=============================================================================

;; fortran-mode
(add-hook 'fortran-mode-hook
          (lambda ()
            ;; インデントの変更
            (setq fortran-continuation-indent 4
                  fortran-structure-indent 2
                  fortran-do-indent 2
                  fortran-if-indent 2)
            (fortran-auto-fill-mode 1) ;; wrap lines in 72 columns
            ))

;; f90-mode
(add-hook 'f90-mode-hook
          (lambda ()
            (setq
             ;; キーワードの最初の1文字を大文字で
             f90-auto-keyword-case 'downcase-word
             ;; 継続行の最初に"&"を追加
             f90-beginning-ampersand t
             ;; インデントの変更
             f90-continuation-indent 4
             f90-do-indent 2
             f90-if-indent 2
             f90-type-indent 2
             f90-program-indent 2
             f90-leave-line-no nil)
            (setq comment-column 35)
            ))

;;;=============================================================================
;;; Ruby mode
;;;=============================================================================
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (setq ruby-deep-indent-paren-style nil)))
;;;=============================================================================
;;; Python mode
;;;=============================================================================

;; IPython
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

;;;=============================================================================
;;; CMake mode
;;;
;;; Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake
;;; source files. <http://www.cmake.org/CMakeDocs/cmake-mode.el>
;;; ============================================================================
(when (require 'cmake-mode nil t)
  (setq auto-mode-alist
        (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                  ("\\.cmake\\'" . cmake-mode))
                auto-mode-alist)))

;;;=============================================================================
;;; YAML mode -- YAML Ain't Markup Language
;;;  <http://yaml-mode.clouder.jp/>
;;;=============================================================================
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  )


;;;=============================================================================
;;; Doxymacs -- Doxygen + Emacs
;;;  <http://doxymacs.sourceforge.net/>
;;;=============================================================================
(when (require 'doxymacs nil t)
  (defun my-doxymacs-font-lock-hook ()
    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
        (doxymacs-font-lock)))
  (setq doxymacs-doxygen-style "Qt") ;; Qt or JavaDoc or C++ or C++!
  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
  (add-hook 'c-mode-common-hook 'doxymacs-mode))

;;;=============================================================================
;;; Markdown Mode
;;;   <http://jblevins.org/projects/markdown-mode/>
;;;=============================================================================
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;;=============================================================================
;;; Pandoc Mode
;;;   <http://joostkremers.github.io/pandoc-mode/>
;;;=============================================================================
;; C-c/r ~ Run pandoc on the document (pandoc-run-pandoc)
;; C-c/p ~ Run markdown2pdf on the document (pandoc-convert-to-pdf)
;; C-c/s ~ Save the settings file (pandoc-save-settings-file)
;; C-c/w ~ Set the output format (pandoc-set-write)
;; C-c/m ~ Set a metadata item (pandoc-set-metadata)
;; C-c/v ~ Set a template variable (pandoc-set-variable)
;; C-c/V ~ View the output buffer (pandoc-view-output)
;; C-c/S ~ View the current settings (pandoc-view-settings)
;; C-c/c ~ Insert a new (@)-item (pandoc-insert-@)
;; C-c/C ~ Select and insert a (@)-label (pandoc-select-@)
(when (load "pandoc-mode" nil t)
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  )
