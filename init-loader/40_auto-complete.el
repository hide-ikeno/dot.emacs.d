;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/inits/60_auto-complete.el
;;; Description: Setup Auto Complete
;;;

;; (el-get 'sync '(auto-complete
;;                 auto-complete-chunk
;;                 ;; auto-complete-clang
;;                 auto-complete-css
;;                 auto-complete-emacs-lisp
;;                 auto-complete-etags
;;                 ;; auto-complete-extension
;;                 auto-complete-latex
;;                 auto-complete-ruby
;;                 ac-dabbrev
;;                 ac-math))

;;;=============================================================================
;;; Auto Complete -- An Intelligent auto-completion extension for Emacs
;;;   <https://github.com/auto-complete/auto-complete>
;;;=============================================================================
(el-get-bundle auto-complete)

(use-package auto-complete-config
  :config
  (add-to-list 'ac-dictionary-directories (locate-user-emacs-file "ac-dict"))
  ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
  (setq ac-delay 0.3)
  (ac-config-default)
  (add-to-list 'ac-modes 'text-mode)
  (add-to-list 'ac-modes 'fundamental-mode)
  (ac-set-trigger-key "TAB")
  (setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
  (setq ac-use-fuzzy t)          ;; 曖昧マッチ
  )
