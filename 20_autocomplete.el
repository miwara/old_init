;; auto-complete
;; last update : 2011/11/03
;

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

(global-auto-complete-mode t)
;; Maybe default-enable-multibyte-characters is t by default
;(setq default-enable-multibyte-characters t)
