;; lisp test
;; last update : 2012/12/06
;

(require 'magit)

(load "google")


;;; カーソル位置はそのままでページを1行スクロール
;
;;; up
(defun next-line-recenter ()
  (interactive)
  (next-line)
  (recenter)
  )

;;; down
(defun previous-line-recenter ()
  (interactive)
  (previous-line)
  (recenter)
  )

(global-set-key (kbd "C->") 'next-line-recenter)
(global-set-key (kbd "C-<") 'previous-line-recenter)
