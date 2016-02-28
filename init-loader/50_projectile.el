;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: 50_projectile.el
;;; Description: Setup projectile
;;;
;;; Code:
;;;

;;;==============================================================================
;;; Projectile --- Project Interaction Library for Emacs
;;;==============================================================================
(el-get-bundle projectile)

(use-package projectile
  :commands
  projectile-global-mode
  projectile-ag
  projectile-invalidate-cache
  projectile-find-dir
  projectile-find-file-in-directory
  ggtags-update-tags
  projectile-ibuffer
  projectile-switch-project
  projectile-remove-known-project
  projectile-find-dir-other-window
  :defines
  projectile-completion-system
  projectile-enable-caching
  projectile-find-dir-other-window
  projectile-indexing-method
  hydra-projectile-other-window
  :init
  (projectile-global-mode)
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)

  (defhydra hydra-projectile-other-window (:color teal)
    "projectile-other-window"
    ("f"  projectile-find-file-other-window        "file")
    ("g"  projectile-find-file-dwim-other-window   "file dwim")
    ("d"  projectile-find-dir-other-window         "dir")
    ("b"  projectile-switch-to-buffer-other-window "buffer")
    ("q"  nil                                      "cancel" :color blue))

  (defhydra hydra-projectile (:color teal :hint nil)
    "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current

  _d_: dir

"
    ("a"   projectile-ag)
    ("b"   projectile-switch-to-buffer)
    ("c"   projectile-invalidate-cache)
    ("d"   projectile-find-dir)
    ("s-f" projectile-find-file)
    ("ff"  projectile-find-file-dwim)
    ("fd"  projectile-find-file-in-directory)
    ("g"   ggtags-update-tags)
    ("s-g" ggtags-update-tags)
    ("i"   projectile-ibuffer)
    ("K"   projectile-kill-buffers)
    ("s-k" projectile-kill-buffers)
    ("m"   projectile-multi-occur)
    ("o"   projectile-multi-occur)
    ("s-p" projectile-switch-project "switch project")
    ("p"   projectile-switch-project)
    ("s"   projectile-switch-project)
    ("r"   projectile-recentf)
    ("x"   projectile-remove-known-project)
    ("X"   projectile-cleanup-known-projects)
    ("z"   projectile-cache-current-file)
    ("`"   hydra-projectile-other-window/body "other window")
    ("q"   nil "cancel" :color blue))

  (bind-key "C-c P" 'hydra-projectile/body)
  )
