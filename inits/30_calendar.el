;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/30_calendar.el
;;; Description: Customize calendar
;;;

;;; japanese-holidays.el -- calender に日本の祝日を表示
;;  <http://www.meadowy.org/meadow/netinstall/export/799/branches/3.00/pkginfo/japanese-holidays/japanese-holidays.el>
(use-package japanese-holidays
  :config
  (add-hook 'calendar-load-hook
			(lambda ()
			  (require 'japanese-holidays)
			  (setq calendar-holidays
					(append japanese-holidays local-holidays other-holidays))))
  (setq mark-holidays-in-calendar t)
  (setq calendar-weekend-marker 'diary)
  (add-hook 'today-visible-calendar-hook 'calendar-mark-weekend)
  (add-hook 'today-invisible-calendar-hook 'calendar-mark-weekend)
  )