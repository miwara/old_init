;; auto async byte compile
;; last update : 2011/12/04
;

(require 'auto-async-byte-compile)

;; 自動バイトコンパイルを無効にするファイル名の正規表現
;
(setq auto-async-byte-compile-exclude-files-reqexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
