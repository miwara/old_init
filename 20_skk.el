;;; skk-mode
;; last update : 2012/07/05
;

(require 'skk-autoloads)
;; skk.tutと辞書ファイルの場所を指定
(setq skk-tut-file "~/.emacs.d/elisp/ddskk-14.3/dict/SKK.tut")
(setq skk-large-jisyo"~/.emacs.d/elisp/ddskk-14.3/dict/SKK-JISYO.L")

(setq skk-kakutei-key "\C-o")

(setq-default skk-kutouten-type 'en)

(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)

(autoload 'skk-mode "skk" nil t)
(autoload 'skk-auto-fill-mode "skk" nil t)
(autoload 'skk-tutorial "skk-tut" nil t)
(autoload 'skk-isearch-mode-setup "skk-isearch" nil t)
(autoload 'skk-isearch-mode-cleanup "skk-isearch" nil t)
(add-hook 'isearch-mode-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-setup) ))))
(add-hook 'isearch-mode-end-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-cleanup)
			   (skk-set-cursor-properly) ))))
