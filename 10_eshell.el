;; Eshell
;; last update : 2011/10/31
;

(add-hook 'eshell-mode-hook (lambda ()
			      (define-key eshell-mode-map "\C-a" 'eshell-bol)
			      (setq eshell-scroll-show-maximum-output t)
			      (setq eshell-scroll-to-bottom-on-output nil)
			      (setq eshell-save-history-on-exit nil)
			      (setq eshell-cmpl-ignore-case t)
))

;; F6ÉLÅ[Ç≈EshellãNìÆ
;
(global-set-key [f6] 'eshell)

;; Eshell clear
;
(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
