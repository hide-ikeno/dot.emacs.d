;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_python.el
;;; Description: Major mode for other langulage
;;;
;;; Code:
;;;

;;;=============================================================================
;;; YAML mode -- YAML Ain't Markup Language
;;;  <http://yaml-mode.clouder.jp/>
;;;=============================================================================
(use-package yaml-mode
  :mode (("\\.yml$"  . yaml-mode)
         ("\\.yaml$" . yaml-mode))
  :config
  (bind-keys :map yaml-mode-map
             ("\C-m" . newline-and-indent))
  )

;;;=============================================================================
;;; Markdown Mode
;;;   <http://jblevins.org/projects/markdown-mode/>
;;;=============================================================================
(use-package markdown-mode
  :mode (("\\.text\\'"     . markdown-mode)
         ;; ("\\.txt\\'"      . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'"       . markdown-mode))
  )

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
(use-package pandoc-mode
  :config
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  )
