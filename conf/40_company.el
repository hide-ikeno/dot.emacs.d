;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/40_company.el
;;; Description: Company mode for automatic text completion
;;;
;;; Code:
;;;

(el-get 'sync '(company))

;;;=============================================================================
;;; company-mode -- Modular in-buffer completion framework for Emacs
;;;=============================================================================
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )
  ;; company                      available      Modular text completion framework
  ;; company-anaconda             available      Anaconda backend for company-mode.
  ;; company-auctex               available      Company-mode auto-completion for AUCTeX.
  ;; company-c-headers            available      Company mode backend for C/C++ header files.
  ;; company-cabal                available      Company-mode completion back-end for haskell-cabal-mode 
  ;; company-ghc                  available      Company-mode ghc-mod backend.
  ;; company-inf-ruby             available      Completion back-end for inf-ruby
  ;; company-irony                available      company-mode completion back-end for irony-mode
  ;; company-mode                 available      Modular in-buffer completion framework for Emacs
  ;; company-tern                 available      Tern backend for company-mode.
