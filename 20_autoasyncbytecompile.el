;; auto async byte compile
;; last update : 2011/12/04
;

(require 'auto-async-byte-compile)

;; �����o�C�g�R���p�C���𖳌��ɂ���t�@�C�����̐��K�\��
;
(setq auto-async-byte-compile-exclude-files-reqexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
