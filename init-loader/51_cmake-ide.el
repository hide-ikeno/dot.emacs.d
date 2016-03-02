;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 51_cmake-ide.el
;;; Description: Make Emacs as C/C++ IDE
;;;
;;; Code:

;;;=============================================================================
;;; Irony-Mode --- A C/C++ minor mode powered by libclang
;;;=============================================================================
(el-get-bundle irony-mode)
(use-package irony
  :defines irony-mode-map
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )

;;;=============================================================================
;;; flycheck-irony --- Flycheck checker for irony-mode
;;;=============================================================================
(el-get-bundle flycheck-irony)
(use-package flycheck-irony
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )

;;;=============================================================================
;;; irony-eldoc --- irony-mode support for eldoc-mode
;;;=============================================================================
(el-get-bundle irony-eldoc)
(use-package irony-eldoc
  :config
  (add-hook 'irony-mode-hook 'irony-eldoc)
  )

;;;=============================================================================
;;; company-irony
;;;=============================================================================
(el-get-bundle company-irony)
(el-get-bundle company-irony-c-headers)
(use-package company-irony
  :config
  (use-package company
    :config
    (add-to-list 'company-backends '(company-irony-c-headers company-irony)))
  )

;;;=============================================================================
;;; RTags -- A c/c++ client/server indexer for c/c++/objc[++] with integration
;;;          for Emacs based on clang <https://github.com/Andersbakken/rtags>
;;;
;;; RTags server and client must be installed separatelly
;;;=============================================================================
(el-get-bundle rtags)
(use-package rtags
  :commands
  rtags-enable-standard-keybindings
  :config
  (rtags-enable-standard-keybindings c-mode-base-map))

;;;=============================================================================
;;; cmake-ide -- Use Emacs as a C/C++ IDE
;;;=============================================================================
(el-get-bundle cmake-ide
  :commands
  cmake-ide-setup
  :config
  (cmake-ide-setup))
