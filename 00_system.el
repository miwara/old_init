;;; Emacs System
;; last update : 2012/12/12
;

;;; �����t���[���̐ݒ�
;
(setq default-frame-alist
      (append (list '(foreground-color . "white")
		    '(background-color . "black")
		    '(border-color . "black")
		    '(mouse-color . "white")
		    '(cursor-color . "blue")
		    '(width . 100)
		    '(height . 45)
		    '(top . 15)
		    '(left . 650)
		    '(font . "IPA�S�V�b�N")
		    )
	      default-frame-alist))

; �t�H���g�e�X�g
; THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.
; the quick brown fox jumps over the lazy dog.0123456789

;;; ���[�h���C���̔w�i�C�����̐F��ݒ�
;
(set-face-background 'modeline "OrangeRed3")
(set-face-foreground 'modeline "SeaGreen3")

;;; ���[�h���C���Ɏ�����\������
;
(display-time)

;;; ���ݍs�ɐF��t����
;
(global-hl-line-mode 1)
(set-face-background 'hl-line "deep sky blue") ;�F
(set-face-foreground 'highlight "wheat")
;; M-x list-colors-display �ŐF�ꗗ

;;; *scratch* �o�b�t�@�̃��b�Z�[�W������
;
(setq initial-scratch-message "")

;;; ����������Emacs�N�����ɂ��ۑ�����
;
(savehist-mode 1)

;;; ����window�ɂ����Ƃ��̃J�[�\���ړ��ݒ�(Shift-��,��,��,�� �ňړ�)
;
;(windmove-default-keybindings)
(global-set-key (kbd "C-S-<left>") 'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>") 'windmove-up)
(global-set-key (kbd "C-S-<down>") 'windmove-down)

;;; �t�@�C�����̃J�[�\���ʒu���L�^����
;
(setq-default save-place t)
(require 'saveplace)

;; �^�C���X�^���v��\������
;
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "last update : ")
(setq time-stamp-format "%04y/%02m/%02d")
(setq time-stamp-end " \\|$")

;;; �Ή����銇�ʂ�\��������
;
(show-paren-mode 1)
; �F�ݒ�
(setq show-paren-style 'mixed)
; �}�b�`�����Ƃ��̐ݒ�
(set-face-foreground 'show-paren-match-face "black")
(set-face-background 'show-paren-match-face "green")
; �~�X�}�b�`�����Ƃ��̐ݒ�
(set-face-foreground 'show-paren-mismatch-face "black")
(set-face-background 'show-paren-mismatch-face "light coral")

;;; �V�F���ɍ��킹�邽�߁CC-h�͌�ނɊ��蓖�Ă�
;;; �w���v��<F1>���g����
;
(global-set-key (kbd "C-h") 'delete-backward-char)

;; �s�ԍ��E���ԍ���\������
;
(line-number-mode 1)
(column-number-mode 1)

;; �Ō�s�ɕK��1�s�}������
;
(setq require-final-newline t)

;;; ���[�W�����ɐF��t����
;
(transient-mark-mode 1)

;;; GC�����炵�Čy������(�f�t�H���g��10�{)
;;; ���݂̃}�V���p���[�ł͂����Ƒ傫�����Ă��悢
;
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ���O�̋L���s���𑝂₷
;
(setq message-log-max 10000)

;;; �~�j�o�b�t�@���ċA�I�ɌĂяo����悤�ɂ���
;
(setq enable-recursive-minibuffers nil)

;;; �_�C�A���O�{�b�N�X���g��Ȃ��悤�ɂ���
;
(setq use-dialog-box 'message)

;;; ��������������ۑ�����
;
(setq history-length 1000)

;;; �L�[�X�g���[�N���G�R�[�G���A�ɑ����\������
;
(setq echo-keystrokes 0.1)

;;; �傫���t�@�C�����J���Ƃ��Ɍx���𔭐�������
;;; �f�t�H���g��10MB. 250MB�Ɋg��
;
(setq large-file-warning-threshold (* 25 1024 1024))

;;; �~�j�o�b�t�@�œ��͂��������Ă������Ɏc��
;;; ����Ď������ē��͂�������̂�h������
;
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;;; y�Ɠ��͂���
;
(defalias 'yes-or-no-p 'y-or-n-p)

;;; �c�[���o�[�ƃX�N���[���o�[������
;
(tool-bar-mode nil)
(scroll-bar-mode nil)

;; �X�N���[������s�Âɂ���
;
(setq scroll-step 1)

;;; �摜�t�@�C����\������
;
(auto-image-file-mode t)

;;; �}�E�X�J�[�\��������
;
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

;; ���ʂ̕⊮
;
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;; �������sOFF
;
(setq text-mode-hook 'turn-off-auto-fill)

;;; C-; �Ń��[�W�����I��(M-SPC)�����s���R�����g(�R�����g����Ă���ꍇ�͉���)
;
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;;; C-Shif-k �ŃJ�[�\���ʒu����s���܂ł��폜
;
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line"
  (interactive "p")
  (kill-line 0))
;; C-Shift-k �ɐݒ�
;
(global-set-key (kbd "C-S-k") 'backward-kill-line)

;;; �X�^�[�g�A�b�v�X�N���[��
(setq inhibit-startup-screen nil)

;;; �w��s�ֈړ�����
(global-set-key (kbd "C-c l") 'goto-line)

;;; cua-mode
;;; ��`�I���̐ݒ�
(cua-mode t)
(setq cua-enable-cua-keys nil)
