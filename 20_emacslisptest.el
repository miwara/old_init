;; Emacs LISP test
;; tag : open-junk-file,lispxmp,paredit,auto-ansync-byte-compile
;; last update : 2012/12/01
;

;; ���s����p�t�@�C�����J�����߂̐ݒ�
;
(require 'open-junk-file)
;; C-c j �Ŏ��s����p�t�@�C�����J��
;
(global-set-key (kbd "\C-cj") 'open-junk-file)
;; ���̕]�����ʂ𒍎߂��邽�߂̐ݒ�
;
(require 'lispxmp)
;; emacs-lisp-mode �� C-c C-d ���^�C�v����ƒ��߂����
;
(define-key emacs-lisp-mode-map (kbd "\C-c\C-d") 'lispxmp)
;; ���ʂ̑Ή���ێ����ĕҏW����ݒ�
;
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(require 'auto-async-byte-compile)
;; �����o�C�g�R���p�C���𖳌��ɂ���t�@�C�����̐��K�\��
;
(setq auto-ansync-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)		; �����ɕ\�����Ȃ�
(setq eldoc-minor-mode-string "")	; ���[�h���C����Eldoc�ƕ\�����Ȃ�
;; �ނ荇���̂Ƃ�銇�ʂ��n�C���C�g����
;(show-paren-mode 1)
;; ���s�Ɠ����ɃC���f���g���s��
(global-set-key "\C-m" 'newline-and-indent)
;; find-function ���L�[�Ɋ��蓖�Ă���
(find-function-setup-keys)
