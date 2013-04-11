;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/50_org.el
;;; Description: Customize Org mode
;;;

(when (require 'org-install nil t)
  (require 'org)
  (add-to-list 'auto-mode-alist  '("\\.org$" . org-mode))

  ;; keybindings
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)

  ;; Default directory for Org files
  ;; (setq org-directory "~/Dropbox/org")

  ;; Agenda
  (setq org-agenda-files (list "~/Dropbox/org"
                               "~/Dropbox/org/research"
                               "~/org"))

  ;; Task (TODO) list
  ;; "C-c C-t" -> org-todo
  (setq org-use-fast-todo-selection t)
  ;; (setq org-todo-keywords
  ;;       ;; TASK     -- TODO (Project単位)
  ;;       ;; NEXT     -- 次に(ただちに)やるべきタスク
        
  ;;       ;; WAITING  -- 他人からの応答待ち，行動できる状態まで待機
  ;;       ;; DONE     -- 完了
  ;;       ;; SOMEDAY  -- いつかやる
  ;;       ;; CANCELED -- 取りやめた状態
  ;;       '((sequence "TASK(t)" "STARTED(s)"  "WAITING(w@/!)"
  ;;                   "|" "DONE(x!)" "SOMEDAY(s!)" "CANCELED(c@/!)")
  ;;         (sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c@/!)")
  ;;         (sequence "NEXT(n)" "|" "DONE(x!)")))
  (setq org-todo-keywords
        ;; TASK     -- TODO (Project単位)
        ;; NEXT     -- 次に(ただちに)やるべきタスク
        ;; DONE     -- 完了
        ;; WAITING  -- 他人からの応答待ち，行動できる状態まで待機
        ;; HOLD     -- 無期限に，または保留解除するまで棚上げしておくタスク
        ;; SOMEDAY  -- いつかやる
        '((sequence "TASK(t)" "NEXT(n)" "|" "DONE(x!)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "SOMEDAY(s!)" "PHONE")))

  (setq org-todo-state-tags-triggers
        '(("CANCELLED" ("CANCELLED" . t))
          ("WAITING" ("WAITING" . t))
          ("SOMEDAY" ("SOMEDAY" . t))
          ("HOLD" ("WAITING" . t) ("HOLD" . t))
          (done ("WAITING") ("HOLD") ("SOMEDAY"))
          ("TASK" ("WAITING") ("CANCELLED") ("HOLD") ("SOMEDAY"))
          ("NEXT" ("WAITING") ("CANCELLED") ("HOLD") ("SOMEDAY"))
          ("DONE" ("WAITING") ("CANCELLED") ("HOLD") ("SOMEDAY"))))
  
  ;; Task 完了時の時刻を記録
  (setq org-log-done 'time)

  ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and
  ;; org-protocol
  (setq org-capture-templates
        '(("t" "todo" entry (file "~/Dropbox/org/refile.org")
           "* TASK %?\n%U\n%a\n" :clock-in t :clock-resume t)
          ("r" "respond" entry (file "~/Dropbox/org/refile.org")
           "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
          ("n" "note" entry (file "~/Dropbox/org/refile.org")
           "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
          ("j" "Journal" entry (file+datetree  "~/Dropbox/org/journal.org")
           "* %?\n%U\n" :clock-in t :clock-resume t)
          ("w" "org-protocol" entry (file "~/Dropbox/org/refile.org")
           "* TODO Review %c\n%U\n" :immediate-finish t)
          ("p" "Phone call" entry (file "~/Dropbox/org/refile.org")
           "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
          ("h" "Habit" entry (file "~/Dropbox/org/refile.org")
           "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

  ;; Remove empty LOGBOOK drawers on clock out
  (defun bh/remove-empty-drawer-on-clock-out ()
    (interactive)
    (save-excursion
      (beginning-of-line 0)
      (org-remove-empty-drawer-at "LOGBOOK" (point))))

  (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)

  ;;; Refiling configurations
  ;; Targets include this file and any file contributing to the agenda - up to 9
  ;; levels deep
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))

  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  ;;; Refile settings
  ;; Exclude DONE state tasks from refile targets
  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)

  ;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)

  ;; Custom agenda command definitions
  (setq org-agenda-custom-commands
        '(("N" "Notes" tags "NOTE"
           ((org-agenda-overriding-header "Notes")
            (org-tags-match-list-sublevels t)))
          ("h" "Habits" tags-todo "STYLE=\"habit\""
           ((org-agenda-overriding-header "Habits")
            (org-agenda-sorting-strategy
             '(todo-state-down effort-up category-keep))))
          (" " "Agenda"
           ((agenda "" nil)
            (tags "REFILE"
                  ((org-agenda-overriding-header "Tasks to Refile")
                   (org-tags-match-list-sublevels nil)))
            (tags-todo "-CANCELLED/!"
                       ((org-agenda-overriding-header "Stuck Projects")
                        (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
            (tags-todo "-WAITING-CANCELLED/!NEXT"
                       ((org-agenda-overriding-header "Next Tasks")
                        (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                        (org-agenda-todo-ignore-scheduled t)
                        (org-agenda-todo-ignore-deadlines t)
                        (org-agenda-todo-ignore-with-date t)
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(todo-state-down effort-up category-keep))))
            (tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
                       ((org-agenda-overriding-header "Tasks")
                        (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                        (org-agenda-todo-ignore-scheduled t)
                        (org-agenda-todo-ignore-deadlines t)
                        (org-agenda-todo-ignore-with-date t)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-HOLD-CANCELLED/!"
                       ((org-agenda-overriding-header "Projects")
                        (org-agenda-skip-function 'bh/skip-non-projects)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-CANCELLED+WAITING/!"
                       ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                        (org-agenda-skip-function 'bh/skip-stuck-projects)
                        (org-tags-match-list-sublevels nil)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-todo-ignore-deadlines 'future)))
            (tags "-REFILE/"
                  ((org-agenda-overriding-header "Tasks to Archive")
                   (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                   (org-tags-match-list-sublevels nil))))
           nil)
          ("r" "Tasks to Refile" tags "REFILE"
           ((org-agenda-overriding-header "Tasks to Refile")
            (org-tags-match-list-sublevels nil)))
          ("#" "Stuck Projects" tags-todo "-CANCELLED/!"
           ((org-agenda-overriding-header "Stuck Projects")
            (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
          ("n" "Next Tasks" tags-todo "-WAITING-CANCELLED/!NEXT"
           ((org-agenda-overriding-header "Next Tasks")
            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
            (org-agenda-todo-ignore-scheduled t)
            (org-agenda-todo-ignore-deadlines t)
            (org-agenda-todo-ignore-with-date t)
            (org-tags-match-list-sublevels t)
            (org-agenda-sorting-strategy
             '(todo-state-down effort-up category-keep))))
          ("R" "Tasks" tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
           ((org-agenda-overriding-header "Tasks")
            (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
            (org-agenda-sorting-strategy
             '(category-keep))))
          ("p" "Projects" tags-todo "-HOLD-CANCELLED/!"
           ((org-agenda-overriding-header "Projects")
            (org-agenda-skip-function 'bh/skip-non-projects)
            (org-agenda-sorting-strategy
             '(category-keep))))
          ("w" "Waiting Tasks" tags-todo "-CANCELLED+WAITING/!"
           ((org-agenda-overriding-header "Waiting and Postponed tasks"))
           (org-tags-match-list-sublevels nil))
          ("A" "Tasks to Archive" tags "-REFILE/"
           ((org-agenda-overriding-header "Tasks to Archive")
            (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
            (org-tags-match-list-sublevels nil)))))
  )

