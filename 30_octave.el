;;; octave
;;; last update : 2012/12/01
;

(autoload 'octave-mode "octave-mode" nil t)

(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
	  (lmbda ()
		 (addrev-mode 1)
		 (auto-fill-mode 1)
		 (if (eq window-system 'x)
		     (font-lock-mode 1))))
