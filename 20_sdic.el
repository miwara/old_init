;; sdic
;; last update : 2012/08/10
;

;; �g�p���鎫���t�@�C���̐ݒ�
;
(setq sdic-eiwa-dictionary-list '(
				  (sdicf-client "~/.emacs.d/elisp/sdic-2.1.3/dict/eijiro128.sdic")
				  ))
(setq sdic-waei-dictionary-list '(
				  (sdicf-client "~/.emacs.d/elisp/sdic-2.1.3/dict/waeijiro128.sdic")
				  ))
(autoload 'sdic-describe-word "sdic" "�p�P��̈Ӗ��𒲂ׂ�" t nil)
(global-set-key "\C-cd" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point "sdic" "�J�[�\���̈ʒu�̉p�P��̈Ӗ��𒲂ׂ�" t nil)
(global-set-key "\C-cD" 'sdic-describe-word-at-point)

(setq sdic-default-coding-system 'utf-8-unix)
