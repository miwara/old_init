;;; zencoding
;;; last update : 2012/10/29
;
(require 'zencoding-mode)

(add-hook 'sgml-mode-hook 'zencoding-mode)

;; yasnippet と連携
;
(define-key zencoding-mode-keymap (kbd "<C-return>") 'zencoding-expand-yas)
