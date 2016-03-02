;;; -*- mode: lisp-interaction; coding: utf-8-unix -*-;;
;;;
;;; File: ~/.emacs.d/init.el
;;; Description: Setup file for GNU Emacs.
;;;

;;;=============================================================================
;;; Start Emacs server
;;;=============================================================================

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(server-start)

;;;=============================================================================
;;; exec-path
;;;=============================================================================
(add-to-list 'exec-path "/usr/local/bin")
;; (add-to-list 'exec-path "/usr/texbin")
;;; For OSX El Capitan or later.
(when (eq system-type 'darwin)
  (add-to-list 'exec-path "/Library/TeX/texbin")
  (add-to-list 'exec-path "/usr/local/opt/llvm/bin"))

(setenv "PATH" (mapconcat 'identity exec-path path-separator))

;;;=============================================================================
;;; Emacs directory and load path
;;;=============================================================================
;; User directory (defalut is "~/.emacs.d")
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get root directory ([emacs version]/el-get)
(let ((versioned-dir (locate-user-emacs-file (format "v%s" emacs-version))))
  (setq-default el-get-dir (expand-file-name "el-get" versioned-dir)
                package-user-dir (expand-file-name "elpa" versioned-dir)))

;; put site-lisp and its subdirectories into load-path
(when (fboundp 'normal-top-level-add-subdirs-to-load-path)
  (let* ((dir (locate-user-emacs-file "site-lisp"))
         (default-directory dir))
    (when (file-directory-p dir)
      (add-to-list 'load-path dir)
      (normal-top-level-add-subdirs-to-load-path))))

;;;=============================================================================
;;; el-get -- install and manage elisp code for Emacs
;;;   <https://github.com/dimitri/el-get>
;;;=============================================================================

(add-to-list 'load-path (expand-file-name "el-get" el-get-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Localtion of my local recipes
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "local/el-get/recipes"))
;; (setq el-get-user-package-directory (locate-user-emacs-file "el-get-inits"))

;;;=============================================================================
;;; user-package -- A use-package declaration for simplifying your .emacs
;;;   <https://github.com/jwiegley/use-package>
;;;=============================================================================
(el-get-bundle use-package)
;; (el-get-bundle bind-key)
(el-get-bundle diminish)

(eval-when-compile
  (require 'use-package)
  )
(require 'bind-key)
(require 'diminish)

;;;=============================================================================
;;; init-loader -- loader for configuration files
;;;    <https://github.com/emacs-jp/init-loader>
;;;=============================================================================
(el-get-bundle! emacs-jp/init-loader
  (setq-default init-loader-byte-compile t)
  (setq init-loader-directory (locate-user-emacs-file "init-loader"))
  (init-loader-load init-loader-directory)
  )

;;;=============================================================================
;;; Load customize file
;;;=============================================================================
;;; Split custom-file
(setq custom-file (locate-user-emacs-file ".emacs-custom.el"))

;;(load-file custom-file)

;; (el-get-bundle! noflet)
;; (el-get-bundle! esup)
