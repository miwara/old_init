;; smartrep
;; last update : 2012/02/22
;

(require 'smartrep)

;;; prefix�L�[
;
(defvar ctl-q-map (make-keymap))
(define-key global-map "\C-q" ctl-q-map)

;;; ���[�h���C���̐ݒ�
;

;;; emacs �̊�{�R�}���h
;
(smartrep-define-key
 global-map "C-q" '(
		    ; main-window
		    ("n" . (lambda () (scroll-up 1)))
		    ("p" . (lambda () (scroll-up -1)))
		    ; ������ʑ���
		    ("j" . (lambda () (scroll-other-window 1)))
		    ("k" . (lambda () (scroll-other-window -1)))
		    ("N" . 'scroll-other-window)
		    ("P" . (lambda () (scroll-other-window '-)))
		    ("a" . (lambda () (beginning-of-buffer-other-window 0)))
		    ("e" . (lambda () (end-of-buffer-other-window 0)))
		    ("o" . (lambda () (other-window 1)))
		    ("O" . (lambda () (other-window -1)))
		    ; elscreen
		    ("s" . (lambda () (elscreen-next)))
		    ("S" . (lambda () (elscreen-previous)))
		    ("d" . (lambda () (elscreen-kill)))
		    ))

;;; org-mode
;
(eval-after-load "org"
  '(progn
     (smartrep-define-key
      org-mode-map "C-c" '(
			   ("C-n" . (lambda ()
				      (outline-next-visible-heading 1)))
			   ("C-p" . (lambda ()
				      (outline-previous-visible-heading 1)))
			   ))))
