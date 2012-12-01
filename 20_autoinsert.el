;; autoinsert
;; last update : 2012/10/22
;

(auto-insert-mode)
;; 最後の / は必須
(setq auto-insert-directory "~/.emacs.d/insert/")

; 各ファイルによってテンプレートを切り替える
(setq auto-insert-alist
      (nconc '(
	       ("\\.tex$"  . ["temp.tex" my-template])
	       ("\\.c$" . ["temp.c" my-template])
	       ("\\.java$" . ["temp.java" my-template])
	       ("\\.wiki$" . ["temp.wiki" my-template])
	       ("makefile$" . ["makefile" my-template])
	       ("Make$" . ["makefile" my-template])
	       ("Makefile$" . ["makefile" my-template])
	       ("make$" . ["makefile" my-template])
	       ("build.xml$" . ["build.xml" my-template])
	       )  auto-insert-alist))
(require 'cl)

(defvar template-replacements-alists
  '(
    ("%file%" . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda ()
			      (file-name-sans-extension
			       (file-name-nondirectory (buffer-file-name)))))
    ("%include-guard%" . (lambda ()
			   (format "__SCHEME_%s__"
				   (upcase(file-name-sans-extension
					   (file-name-nondirectory buffer-file-name))))))
    ))

(defun my-template ()
  (time-stamp)
  (mapc #' (lambda(c)
	     (progn
	       (goto-char (point-min))
	       (replace-string (car c) (funcall (cdr c)) nil)))
	   template-replacements-alists)
  (goto-char (point-max))
  (message "done."))
(add-hook 'find-file-not-found-hooks 'auto-insert)



