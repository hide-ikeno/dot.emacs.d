;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_cmake.el
;;; Description: Major mode CMake files
;;;
;;; Code:
;;;

;;;=============================================================================
;;; CMake mode
;;;
;;; Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake
;;; source files. <http://www.cmake.org/CMakeDocs/cmake-mode.el>
;;; ============================================================================
(use-package cmake-mode
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode))
  )
