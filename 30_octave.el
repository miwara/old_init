;;; octave
;;; last update : 2012/12/02
;

(autoload 'octave-mode "octave-mode" nil t)

(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
	  (lambda ()
		 (abbrev-mode 1)
		 (auto-fill-mode 1)
		 (if (eq window-system 'x)
		     (font-lock-mode 1))))
