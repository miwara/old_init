;; YaTeX mode
;; last update : 2012/10/14
;

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq load-path (cons (expand-file-name "~/package/lisp/yatex") load-path))

;; nil=YaTeX-kanji-code �� nil �Ȃ� coding-system �Ɋ��m���Ȃ��D
;; 0=no-conversion -> Emacs�����Ŏg�p����Ă��镶���R�[�h(Emacs 23 �ł� utf-8-emacs)
;; 1=Shift JIS (Shift_JIS)
;; 2=JIS (ISO-2022-JP)
;; 3=EUC (EUC-JP)
;; 4=UTF-8
;
(setq YaTeX-kanji-code 3)

;; dvi ���� pdf ���쐬���� %s �̓t�@�C����
;
(setq dviprint-command-format "dvipdfmx %s")

;; skk�΍�
;
(add-hook 'skk-mode-hook
	  (lambda ()
	    (if (eq major-mode 'yatex-mode)
		(progn
		  (define-key skk-j-mode-map "\\" 'self-insert-command)
		  (define-key skk-j-mode-map "$" 'YaTeX-insert-dollar)
		  ))
	    ))

;; ���b�Z�[�W��euc-jp�ɂ���D
;
(setq YaTeX-latex-message-code 'euc-jp)

;; begin-end �� shortcut �ł͂Ȃ��⊮�𗘗p
;
(setq YaTeX-no-begend-shortcut t)

;; .tex�t�@�C�����J���ƕ����R�[�h�� utf-8 �ɂ���
;
(modify-coding-system-alist 'file "\\.tex\\'" 'euc-jp)
