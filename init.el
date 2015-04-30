;;; -*- mode: lisp-interaction; coding: utf-8-unix -*-;;
;;;
;;; File: ~/.emacs.d/init.el
;;; Description: Setup file for GNU Emacs.
;;;

;; Start Emacs server
(server-start)

;; Emacs directory (defalut is "~/.emacs.d")
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

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

;; exec-path
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/texbin")

;;;=============================================================================
;;; el-get -- install and manage elisp code for Emacs
;;;   <https://github.com/dimitri/el-get>
;;;=============================================================================

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
;; Localtion of my local recipes
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "local/el-get/recipes"))
(setq el-get-user-package-directory (locate-user-emacs-file "el-get-inits"))

;;;=============================================================================
;;; with-eval-after-load-feature.el --- Eval after loading feature with fine
;;; compilation
;;;=============================================================================
(el-get-bundle! with-eval-after-load-feature)

;;;=============================================================================
;;; user-package -- A use-package declaration for simplifying your .emacs
;;;   <https://github.com/jwiegley/use-package>
;;;=============================================================================
(el-get-bundle use-package)
(el-get-bundle bind-key)
(el-get-bundle diminish)

(eval-when-compile
  (require 'use-package))

(require 'bind-key)
(require 'diminish)



;;;=============================================================================
;;; Themes
;;;=============================================================================
(el-get-bundle dream-theme)
(load-theme 'dream t)

;; ;;;=============================================================================
;; ;;; init-loader -- loader for configuration files
;; ;;;    <https://github.com/emacs-jp/init-loader>
;; ;;;=============================================================================
;; (el-get-bundle! emacs-jp/init-loader
;;   (setq-default init-loader-byte-compile t)
;;   (setq init-loader-directory (locate-user-emacs-file "conf"))
;;   (init-loader-load init-loader-directory)
;;   )

(load (locate-user-emacs-file "conf/init-basics"))
(load (locate-user-emacs-file "conf/cocoa-emacs-config"))
(load (locate-user-emacs-file "conf/init-cc-mode"))
(load (locate-user-emacs-file "conf/init-fortran-mode"))
(load (locate-user-emacs-file "conf/init-ruby-mode"))

(load (locate-user-emacs-file "conf/external-packages"))
