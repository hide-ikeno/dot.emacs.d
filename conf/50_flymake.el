;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_flymake.el
;;; Description: Customize flymake
;;;

(when (require 'flymake nil t)

  ;; --- Python ---
  ;;  Using PyFlakes [http://pypi.python.org/pypi/pyflakes]
  ;; (add-to-list 'exec-path "/usr/local/share/python")

  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))

  (add-hook 'python-mode-hook
            '(lambda ()
               (flymake-mode t)))

  ;; --- C ---
  ;; Using Clang
  (defun flymake-clang-c-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "clang" (list "-fsyntax-only"
                          "-fno-color-diagnostics" local-file))))

  (push '("\\.c$" flymake-clang-c-init) flymake-allowed-file-name-masks)
  (push '("\\.h$" flymake-clang-c-init) flymake-allowed-file-name-masks)

  (add-hook 'c-mode-hook
            '(lambda()
               (flymake-mode t)))


  ;; --- C++ ---
  ;; Using Clang
  (defun flymake-clang-c++-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "clang++" (list "-fsyntax-only"
                            "-fno-color-diagnostics"
                            "-std=c++11"
                            "-stdlib=libc++"
                            ;; "-I/usr/local/include/eigen3"
                            ;; "-U__STRICT_ANSI__"
                            ;; "-D__STDC_FORMAT_MACROS"
                            local-file))))

  ;; (push '("\\.cc$" flymake-clang-c++-init) flymake-allowed-file-name-masks)
  (push '("\\.cpp$" flymake-clang-c++-init) flymake-allowed-file-name-masks)
  (push '("\\.hpp$" flymake-clang-c++-init) flymake-allowed-file-name-masks)
  ;; (push '("\\.cxx$" flymake-clang-c++-init) flymake-allowed-file-name-masks)
  ;; (push '("\\.CC$" flymake-clang-c++-init) flymake-allowed-file-name-masks)
  ;; (push '("\\.hxx$" flymake-clang-c++-init) flymake-allowed-file-name-masks)

  (add-hook 'c++-mode-hook
            '(lambda ()
               (flymake-mode t)))
  )
