;; wiki mode
;; last update : 2012/08/18
;

;; wikiにシンボリックリンクを作成しなければ使えない

;;; wiki-mode
;; !!自作!!
;
(defun wiki-mode()
  (interactive)
  (setq major-mode 'wiki-mode)
  (setq mode-name "wiki")
;  (iimage-mode t)
  (run-hooks 'wiki-mode-hook))

(add-hook 'wiki-mode-hook
	  '(lambda ()
	     (turn-on-iimage-mode)
	     (local-set-key "\C-cm" 'wiki-edit-mode)
	     (find-file "~/.emacs.d/wiki/index.wiki")
	     ))

(defun wiki-edit-mode()
  (interactive)
  (setq major-mode 'wiki-edit-mode)
  (setq mode-name "wiki-edit")
  (run-hooks 'wiki-edit-mode-hook))

(add-hook 'wiki-edit-mode-hook
	  '(lambda ()
	    (local-set-key "\C-cw" 'wiki-mode)
	    (local-set-key "\C-ct" 'orgtbl-mode)
;	    (local-set-key "\C-ct" 'table-insert)
;	    (local-set-key "\C-ce" 'table-recognize-table)
	    (local-set-key "\C-cl" 'iimage-mode)

	    ))

(setq auto-mode-alist
      (cons (cons "\\.wiki$" 'wiki-mode) auto-mode-alist))

(global-set-key "\C-cw" 'wiki-mode)
