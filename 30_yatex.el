;; YaTeX mode
;; last update : 2012/10/14
;

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq load-path (cons (expand-file-name "~/package/lisp/yatex") load-path))

;; nil=YaTeX-kanji-code が nil なら coding-system に感知しない．
;; 0=no-conversion -> Emacs内部で使用されている文字コード(Emacs 23 では utf-8-emacs)
;; 1=Shift JIS (Shift_JIS)
;; 2=JIS (ISO-2022-JP)
;; 3=EUC (EUC-JP)
;; 4=UTF-8
;
(setq YaTeX-kanji-code 3)

;; dvi から pdf を作成する %s はファイル名
;
(setq dviprint-command-format "dvipdfmx %s")

;; skk対策
;
(add-hook 'skk-mode-hook
	  (lambda ()
	    (if (eq major-mode 'yatex-mode)
		(progn
		  (define-key skk-j-mode-map "\\" 'self-insert-command)
		  (define-key skk-j-mode-map "$" 'YaTeX-insert-dollar)
		  ))
	    ))

;; メッセージはeuc-jpにする．
;
(setq YaTeX-latex-message-code 'euc-jp)

;; begin-end は shortcut ではなく補完を利用
;
(setq YaTeX-no-begend-shortcut t)

;; .texファイルを開くと文字コードを utf-8 にする
;
(modify-coding-system-alist 'file "\\.tex\\'" 'euc-jp)
