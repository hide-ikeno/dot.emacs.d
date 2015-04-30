;;; -*- mode: lisp-interaction; coding: utf-8-unix; indent-tabs-mode: nil; -*-
;;;
;;; File: ~/.emacs.d/conf/30_calendar.el
;;; Description: Customize calendar
;;;

;;; japanese-holidays.el -- calender に日本の祝日を表示
;;  <http://www.meadowy.org/meadow/netinstall/export/799/branches/3.00/pkginfo/japanese-holidays/japanese-holidays.el>
(el-get-bundle japanese-holidays)

;; (when (require 'japanese-holidays nil t)
;;   (add-hook 'calendar-load-hook
;; 			(lambda ()
;; 			  (require 'japanese-holidays)
;; 			  (setq calendar-holidays
;; 					(append japanese-holidays local-holidays other-holidays)))))
;; (setq mark-holidays-in-calendar t)
;; (setq calendar-weekend-marker 'diary)
;; (add-hook 'today-visible-calendar-hook 'calendar-mark-weekend)
;; (add-hook 'today-invisible-calendar-hook 'calendar-mark-weekend)

(use-package japanese-holidays
  :config
  (setq calendar-holidays ;; 他の国の祝日も表示させたい場合は適当に調整
        (append japanese-holidays holiday-local-holidays holiday-other-holidays))
  ;; 祝日をカレンダーに表示
  (setq mark-holidays-in-calendar t)
  ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
  ;; 変数はデフォルトで設定済み
  (setq japanese-holiday-weekend '(0 6)     ;; 土日を祝日として表示
        japanese-holiday-weekend-marker     ;; 土曜日を水色で表示
        '(holiday nil nil nil nil nil japanese-holiday-saturday))
  (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
  (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)
  ;; “きょう”をマークするには以下の設定を追加します。
  (add-hook 'calendar-today-visible-hook 'calendar-mark-today)
  )

